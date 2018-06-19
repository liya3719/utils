import { UploadModel } from '../../models/IndexUploadModel';
/**
 * 首页上传相关接口
 */
export interface IIndexUploadService {
  /**
   * 注册接口
   * @param {UploadModel.RegisterModule} registerModel 注册接口数据实体
   */
  register(registerModel: UploadModel.RegisterModule): Promise<Boolean>;
  /**
   * 登录接口
   * @param {UploadModel.loginModel} loginModel 登录接口数据实体
   */
  login(loginModel: UploadModel.LoginModel): Promise<UploadModel.LoginModel>;
  /**
   * 上传前判断图片是否存在
   * @param imageName 图片名称
   */
  imageIsExist(imageName): Promise<object>;
  /**
   * 上传接口
   * @param ploadModel 上传接口数据实体
   */
  upload(ploadModel: UploadModel.Upload): Promise<Boolean>;
}