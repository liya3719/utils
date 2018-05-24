import { Container, Service, Inject } from 'typedi';
import { IDataAccess } from '../interface/dataAccess/IDataAccess';
import { IGetImagesListService } from '../interface/services/IGetImagesListService';
import { ImagesLst } from '../models/ImgListModel';
import { GetImagesListSql } from '../sqlManage/GetImagesListSql';

/**
 * 获取图片列表Service
 * @class
 * @implements IGetImagesListService
 */
@Service('GetImagesListService')
export class GetImagesListService implements IGetImagesListService {
  /**
   * 数据库操作实例
   */
  @Inject('dataAccess')
  dataAccessInstance: IDataAccess;

  /**
   * 获取图片列表
   * @param id 当前用户id
   */
  async getImagesList(id: number): Promise<ImagesLst.ImagesLstModel> {
    let result: any = await this.dataAccessInstance.execSql(GetImagesListSql.GetImagesList, [id]);
    let imagesList: any = result.result;
    let tempResult: any = {
      total: imagesList.length,
      list: imagesList
    };
    let imagesListModel: ImagesLst.ImagesLstModel = <ImagesLst.ImagesLstModel>tempResult;
    return imagesListModel;
  }
}