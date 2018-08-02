import { Controller, Get, Body, Param, QueryParam } from 'routing-controllers';
import { Inject } from 'typedi';
import { ImagesLst } from '../models/ImgListModel';
import { GetImagesListService } from '../services/GetImagesListService';
/**
 * 获取图片列表
 */
@Controller('/api')

export class GetImagesList {
  /**
   * 获取图片列表服务实例
   */
  @Inject('GetImagesListService')
  GetImagesListServiceInstance: GetImagesListService;

  @Get('/images/list/:id')
  /**
   * 获取图片列表
   * @param {id} 用户id
   * @return 图片列表实体
   */
  async getImagesListAction(@Param("id") id: number, @QueryParam('pageIndex') pageIndex: number, @QueryParam('pageSize') pageSize: number): Promise<ImagesLst.ImagesLstModel> {
    if (isNaN(id)) {
      throw Error('用户id不存在');
    }
    let imagesList: ImagesLst.ImagesLstModel = await this.GetImagesListServiceInstance.getImagesList(id, pageIndex, pageSize);
    return imagesList;
  }
}