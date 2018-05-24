/**
 * 获取图片列表相关Sql语句
 */

export class GetImagesListSql {
  /**
   * 获取图片列表url
   */
  static GetImagesList: string = `
    select image_url from upload_images_list
    where user_id = ?
  `
}