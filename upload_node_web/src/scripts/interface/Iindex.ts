/**
 * 上传首页需要的接口
 * @class
 */
export interface IndexInterface {
  /**
   * 登录接口
   * @param user_name 登录需要的邮箱
   * @param password 登录需要的密码
   */
  login(user_name: string, password: any): Promise<any>;
  /**
   * 注册接口
   * @param user_name 注册需要的邮箱
   * @param password 注册需要的密码
   */
  register(user_name: string, password: any): Promise<any>;
  /**
   * 上传图片接口
   * @param id 用户id
   * @param image 图片列表
   * @param update_time 更新时间
   */
  upload(id: number, image: any, update_time: any): Promise<any>;
  /**
   * 同步到gitlba，不需要传参
   */
  syncGitlab(): Promise<any>;
}