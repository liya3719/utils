const co = require('co');
const chalk = require('chalk');
const shell = require('shelljs');
const prompt = require('co-prompt');
const inquirer = require('inquirer');
const natTest = require('./lib/nat.test');
const testMaster = require('./lib/test.master');
const preRelease = require('./lib/pre.release');
const preHotfix = require('./lib/pre.hotfix');

module.exports = function () {
  co(function* () {
    inquirer.prompt({
      type: 'list',
      name: 'branch',
      message: '请选择发布分支:',
      choices: [
        'nat/test',
        'master',
        'release',
        'hotfix'
      ]
    }).then((answer) => {
      let branch = answer.branch;
      return branch;
    }).then((data) => {
      switch (data) {
        case "nat/test":
          console.log(`发布分支  ${chalk.cyan(data)}`);
          natTest();
          break;
        case "master":
          console.log(`本地分支发布到master ${chalk.cyan(data)}`);
          testMaster();
          break;
        case "release":
          console.log(`发布分支  ${chalk.magenta(data)}`);
          preRelease();
          break;
        case "hotfix":
          console.log(`发布分支  ${chalk.red(data)}`);
          preHotfix();
          break;
      }
    });
  });
}