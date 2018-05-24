import {
  BaseView,
  Component,
  Vue,
  Emit,
  Watch,
  Prop,
  Model
} from "../BaseView";
import { Container } from "typedi";
//@ts-ignore;
import SliderNav from "../../components/sliderNav/app.vue";
import { ListInterface } from '../../interface/IList';
import { ListModel } from '../../models/ListModel';
import { ListService } from '../../services/listService';
import commonService from '../../common/common';
const CommonService = new commonService();
@Component({
  components: { SliderNav }
})
export default class List extends BaseView {
  imgList: any = {};
  mounted() {
    this.getImagesList();
  }
  /**
   * 获取图片列表
   */
  async getImagesList() {
    let _self = this;
    let user_id: number = Number(CommonService.getCookie('user_id'));
    let result: ListModel.imgListModel = await Container.get<ListService>('imglist').getImgList(user_id);
    if (result.total > 0) {
      _self.imgList = result.list;
    }
    console.log(_self.imgList);
  }
}