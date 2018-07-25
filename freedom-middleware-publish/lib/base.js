'use strict';
const path = require('path');
const shell = require('shelljs');
const fileName = require(process.cwd() + '/package.json').name;
const url = 'http://vcs.51talk.com/api/v3/projects?private_token=pKGxG9hoHVvkAfyfyhrH';
var branch = shell.exec('git symbolic-ref --short -q HEAD');
branch = branch.replace(/\n/, '');

module.exports = {
  'fileName': fileName,
  'branch': branch,
  'url': url
}
