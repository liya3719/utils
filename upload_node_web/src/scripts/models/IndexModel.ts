import BaseModel from "./BaseModel";

/**
 * 上传首页数据实体
 */

export module IndexModel {
  /**
   * 上传图片数据实体
   */
  export class UploadModel extends BaseModel {
    res: uploadData = new uploadData();
  }
  /**
   * 注册数据实体
   */
  export class RegisterModel extends BaseModel {
    res: registerData = new registerData();
  }
  /**
   * 登录数据实体
   */
  export class loginModel extends BaseModel {
    res: loginData = new loginData();
  };

  export class uploadData {
    /**
     * 用户id
     */
    user_id: number;
    /**
     * 上传的图片列表
     */
    image_url: any;
    /**
     * 更新时间
     */
    update_time: any;
  }
  export class registerData {
    /**
     * 注册用户名
     */
    user_name: string;
    /**
     * 注册密码
     */
    password: string;
  }
  export class loginData {
    /**
     * 登录用户名
     */
    user_name: string;
    /**
     * 登录密码
     */
    password: string;
  }
}