/**
 * 获取图片列表相关Sql语句
 */

export class GetImagesListSql {
  /**
   * 获取图片列表url
   */
  static getImageList: string = `
    select image_url from upload_images_list
    where user_id = ? order by update_time desc limit {start}, {end}
  `;
  /**
   * 获取当前id上传图片的数量
   */
  static getImageListCount: string = `
    select count(image_url) as count from upload_images_list where user_id = ?
  `;
  /**
   * 根据图片自增id删除图片
   */
  static deleteImageById: string = `
    delete from upload_images_list where id = ?
  `
}