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
//@ts-ignore;
import pageComponent from '../../components/page/app.vue';
import { ListInterface } from '../../interface/IList';
import { ListModel } from '../../models/ListModel';
import { ListService } from '../../services/listService';
import commonService from '../../common/common';
const CommonService = new commonService();
@Component({
  components: { SliderNav, pageComponent }
})
export default class List extends BaseView {
  imgList: any = {};
  prePage: number;
  pageIndex: number = 1;
  total: number;
  mounted() {
    this.getImagesList();
  }
  /**
   * 获取图片列表
   */
  async getImagesList() {
    let _self = this;
    let user_id: number = Number(CommonService.getCookie('user_id'));
    let result: ListModel.imgListModel = await Container.get<ListService>('imglist').getImgList(user_id, _self.pageIndex, 10);
    this.total = result.total;
    this.prePage = Math.ceil(this.total / 10);
    if (result.total > 0) {
      _self.imgList = result.list;
    }
  }
  pageChange(page) {
    this.pageIndex = page;
    this.getImagesList();
  }
}