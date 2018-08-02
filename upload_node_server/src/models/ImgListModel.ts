/**
 * 图片列表页数据实体
 */
export module ImagesLst {
  export class ImagesLstModel {
    list: Array<imageModel> = new Array<imageModel>();
  }
  export class imageModel {
    /**
    * 图片自增id
    */
    id: number;
    /**
     * 用户id
     */
    user_id: number;
    /**
     * 第几页
     */
    pageIndex: number;
    /**
     * 显示数据条数
     */
    pageSize: number;
    /**
    * 图片url
    */
    images_url: string;
    /**
     * 更新时间
     */
    update_time: number;
  }
}