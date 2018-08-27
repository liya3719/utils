/**
 * 获取上传script列表sql
 */

export class GetScriptListSql {
    /**
     * 获取script列表url
     */
    static getScriptUrl: string = `
      select script_url from upload_script_list
      where user_id = ? order by update_time desc limit {start}, {end}
    `;
    /**
     * 获取当前id上传script的数量
     */
    static getScriptCount: string = `
      select count(image_url) as count from upload_images_list where user_id = ?
    `;
    /**
     * 根据script自增id删除js文件
     */
    static deleteScriptById: string = `
      delete from upload_images_list where id = ?
    `
  }