import { ImagesLst } from '../../models/ImgListModel';
/**
 * 获取图片列表
 */
export interface IGetImagesListService {
  /**
   * 获取图片列表
   * @param id 用户id
   */
  getImagesList(id: number): Promise<ImagesLst.ImagesLstModel>;
}