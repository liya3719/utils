/**
 * 上传script需要的实体
 */
export interface IScriptList {
    /**
     * 获取上传js列表
     */
    getScriptList(id: number, pageIndex: number, pageSize: number): Promise<any>;
    /**
     * 删除单个js文件
     */
    deleteScriptById(id: number): Promise<any>;
}