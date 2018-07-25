'use strict';
const co = require('co');
const fs = require('fs');
const path = require('path');
const shell = require('shelljs');
const request = require('request');
const prompt = require('co-prompt');
const inquirer = require('inquirer');
const base = require('./base.js');
const utils = require('@nat/heibao-utils');
const fileName = base.fileName;
const url = base.url;
const util = require('./util.js');
const httpUtil = new util();
const dir = path.resolve(__dirname, '../../../../../../');
const dirPath = `${dir}/fe-online__hotfix`;

/**
 * 创建文件夹,保存fe-online备份
 * @param {path} 创建的文件夹路径
 */
function isCreateFolder(dirPath) {
  if (fs.existsSync(dirPath)) {
    return true;
  } else {
    if (isCreateFolder(path.dirname(dirPath))) {
      fs.mkdirSync(dirPath);
      return true;
    }
  }
}
isCreateFolder(dirPath);
/**
 * 发布到fe-online仓库hotfix分支
 * @return {[type]} [description]
 */
module.exports = function () {
  co(function* () {
    let pms = utils.dateFormat('yyyyMMddhhmmss', new Date());
    // 把要发布的项目切换到master分支，确保!!
    shell.exec('git checkout master');
    let id = yield httpUtil.baseHandler(request, url, 'fe-online');
    let sourcePath = process.cwd();
    shell.exec('git clone git@vcs.51talk.com:nat/fe-online.git');
    shell.cd('fe-online');
    let data = {
      "branch": pms,
      "ref": "hotfix"
    }
    // 创建分支 从fe-onlien
    yield httpUtil.createNewBranch(request, id, data);
    shell.exec(`git fetch origin ${pms}:${pms}`);
    shell.exec(`git checkout ${pms}`);
    shell.exec('git pull origin hotfix');
    yield inquirer.prompt({
      type: 'list',
      name: 'status',
      message: `是否发布项目${fileName}到Apollo`,
      choices: [
        'yes',
        'no'
      ]
    }).then((answer) => {
      // 获取用户选择的状态
      let status = answer.status;
      return status;
    }).then((data) => {
      // 发布到Apollo
      if (data === 'yes') {
        shell.cd('apollo');
        // 保存当前的目录
        let feOnlinePath = process.cwd();
        // 判断文件夹是否存在
        let isExist = httpUtil.isExists(process.cwd() + '/' + fileName);
        // 查看Apollo文件里面是否包含发布的文件, 如果包含就先删除
        if (isExist) {
          shell.cp('-R', fileName, dirPath);
          shell.cd(dirPath);
          shell.mv(fileName, `${fileName}_${pms}`);
          shell.cd(feOnlinePath);
          shell.rm('-rf', fileName);
        }
        shell.cd(`${sourcePath}/build/`);
        shell.cp('-R', fileName, `${sourcePath}/fe-online/apollo/`);
        shell.cd(`${sourcePath}/fe-online/`);
        shell.exec('git status');
        shell.exec('git add .');
        shell.exec(`git commit -m ${pms}`);
        shell.exec(`git push origin ${pms}`);
      } else {
        // 保存当前的目录
        let feOnlinePath = process.cwd();
        // 判断文件夹是否存在
        let isExist = httpUtil.isExists(process.cwd() + '/' + fileName);
        // 查看Apollo文件里面是否包含发布的文件, 如果包含就先删除
        if (isExist) {
          shell.cp('-R', fileName, dirPath);
          shell.cd(dirPath);
          shell.mv(fileName, `${fileName}_${pms}`);
          shell.cd(feOnlinePath);
          shell.rm('-rf', fileName);
          console.log('删除了文件夹');
        }
        shell.cd(`${sourcePath}/build/`);
        shell.cp('-R', fileName, `${sourcePath}/fe-online/`);
        shell.cd(`${sourcePath}/fe-online/`);
        shell.exec('git status');
        shell.exec('git add .');
        shell.exec(`git commit -m ${pms}`);
        shell.exec(`git push origin ${pms}`);
      }
    })
    // merge request 入参
    var createMRdata = {
      "source_branch": pms,
      "target_branch": "hotfix",
      "title": pms,
      "description": pms,
      "assignee_id": 276
    }
    // 发起mergre request
    yield httpUtil.createMergeRequest(request, id, createMRdata);
    shell.exec('git checkout hotfix');
    shell.exec(`git branch -D ${pms}`);
    shell.cd(sourcePath);
    shell.rm('-rf', 'fe-online');
    process.exit();
  })
}