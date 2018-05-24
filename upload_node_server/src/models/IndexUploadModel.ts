
/**
 * 上传首页相关数据实体
 */

export module UploadModel {
  /**
   * 注册接口数据实体
   */
  export class RegisterModule {
    /**
     * 自增id
     */
    id: number;
    /**
     * 用户名
     */
    user_name: string;
    /**
     * 密码
     */
    password: any;
  }
  /**
   * 登录接口数据实体
   */
  export class LoginModel {
    /**
     * 用户id
     */
    id: number;
    /**
     * 用户名
     */
    user_name: string;
    /**
     * 密码
     */
    password: any;
  }
  /**
   * 上传接口数据实体
   */
  export class Upload {
    /**
     * 用户id
     */
    user_id: number;
    /**
     * 上传图片的url
     */
    image_url: string;
    /**
     * 上传时间
     */
    update_time: number;
  }
}