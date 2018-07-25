'use strict';
const co = require('co');
const chalk = require('chalk');
const prompt = require('co-prompt');
const shell = require('shelljs');
const request = require('request');
const util = require('./util');
const base = require('./base');
const httpUtil = new util();
const branch = base.branch;
/**
 * 本地分支合并到master分支
 * @return {[type]} [description]
 */

module.exports = function() {
  co(function *(){
    if(!shell.which('git')) {
      shell.echo('Sorry, this script requires git');
      shell.exit(1);
    }
    shell.exec('git status');
    shell.exec('git add .');
    let info = yield prompt('请输入描述信息:');
    shell.exec(`git commit -m ${info}`);
    shell.exec(`git push origin ${branch}`);
    shell.exec('git checkout master');
    shell.exec('git pull origin master');
    shell.exec(`git pull origin ${branch}`);
    shell.exec('npm run build');
    shell.exec('git status');
    shell.exec('git add .');
    shell.exec(`git commit -am ${info}`);
    shell.exec('git push origin master');
    process.exit();
  });
}