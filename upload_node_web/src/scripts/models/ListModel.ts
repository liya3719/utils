import BaseModel from './BaseModel';

/**
 * 获取图片列表数据实体
 */
export module ListModel {
  export class getImgListModel extends BaseModel {
    res: imgListModel = new imgListModel();
  }
  /**
   * 返回图片地址数据实体
   */
  export class imgListModel {
    total: number;
    list: any;
  }
}