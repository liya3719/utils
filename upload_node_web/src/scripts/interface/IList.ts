/**
 * 图片列表接口
 */
export interface ListInterface {
  /**
   * 获取图片列表
   * @param id 用户id 
   */
  getImgList(id: number, pageIndex: number, pageSize: number): Promise<any>;
  /**
   * 删除单个图片
   */
  deleteImageById(id: number): Promise<any>
}