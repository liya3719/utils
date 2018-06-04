const fs = require('fs');
const shell = require('shelljs');
const config = require('config');
const baseUrl = 'http://static.51talk.com/fe-static/images/';
import { mkdirService } from '../mkdir/mkdirService';
/**
 * 处理图片信息流&&图片写入
 */
export class writeFileService {
  /**
   * 上传图片获取信息流写入磁盘文件
   * @param file 图片流信息集合
   */
  async writeFileHandler(file): Promise<any> {
    return new Promise((resolve, reject) => {
      // 上传图片前先创建保存图片的文件夹
      let dirPath = mkdirService.createDirPath();
      mkdirService.isCreateFolder(dirPath);
      // 判断图片大小，如果超过150kb，提示错误
      if (file.size > 153600) {
        resolve({
          code: 20008,
          message: '图片超过150KB，请压缩后重新上传'
        })
      }
      fs.writeFile(`${config.imagesUrl}${file.originalname}`, file.buffer, (err) => {
        if (err) {
          resolve({
            code: 500,
            message: '服务器繁忙，请稍候再试'
          })
        } else {
          resolve({
            code: 10000,
            message: '写入成功',
            url: `${baseUrl}${file.originalname}`
          })
        }
      })
    })
  }
}