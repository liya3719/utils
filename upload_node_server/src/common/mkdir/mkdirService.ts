const fs = require('fs');
const path = require('path');
const process = require('process');
var dirPath;
if (process.platform === 'win32') {
  let baseDir = path.resolve(__dirname, '../../../');
  dirPath = `${baseDir}/fe-static/images/`
} else {
  dirPath = '/data/fe-static/images';
}


/**
 * 创建上传图片目录
 */
export class mkdirService {
  /**
   * 是否创建文件夹
   */
  static isCreateFolder(dirPath) {
    if(fs.existsSync(dirPath)) {
      return true;
    } else {
      if(mkdirService.isCreateFolder(path.dirname(dirPath))) {
        fs.mkdirsSync(dirPath);
        return true;
      }
    }
  }
}
