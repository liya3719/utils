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
   * @param pageIndex 当前页
   * @param pageSize 加载的条数
   */
  async getImagesList(id: number, pageIndex: number, pageSize: number): Promise<ImagesLst.ImagesLstModel> {
    let imageListModel: string = GetImagesListSql.getImageList;
    imageListModel = imageListModel.replace(/{start}/gi, ((pageIndex - 1) * pageSize).toString());
    imageListModel = imageListModel.replace(/{end}/gi, (pageSize).toString())
    let result: any = await this.dataAccessInstance.execSql(imageListModel, [id]);
    let imagesList: any = result.result;
    let count: any = await this.dataAccessInstance.execSql(GetImagesListSql.getImageListCount, [id]);
    let total = count.result[0].count;
    let tempResult: any = {
      total: total,
      list: imagesList
    };
    let imagesListModel: ImagesLst.ImagesLstModel = <ImagesLst.ImagesLstModel>tempResult;
    return imagesListModel;
  }
}