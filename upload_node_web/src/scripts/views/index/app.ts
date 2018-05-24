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
//@ts-ignore
import SliderNav from '../../components/sliderNav/app.vue';
import { IndexModel } from '../../models/IndexModel';
import { IndexService } from '../../services/indexService';
import { IndexInterface } from '../../interface/Iindex';
const utils = require('@nat/heibao-utils');


@Component({
  components: { SliderNav }
})
export default class uploadView extends BaseView {
  id: number = 0;
  loginModal: boolean = false;
  registerModal: boolean = false;
  login_user_name: string = '';
  login_password: any = '';
  register_user_name: string = '';
  register_password: any = '';
  uploading: boolean = false;
  registerTips: boolean = false;
  loginTips: boolean = false;
  file: any;
  /**
   * 上传图片
   * @param event input file 
   */
  uploadImgHandler(e) {
    this.file = e.target.files[0];
  }
  /**
   * 显示登录框
   */
  showLoginModal() {
    this.loginModal = !this.loginModal;
  }
  /**
   * 显示注册框
   */
  showRegisterModal() {
    this.registerModal = !this.registerModal;
  }
  /**
   * 两个弹层来回切换
   */
  switchDialogModal() {
    this.loginModal = !this.loginModal;
    this.registerModal = !this.registerModal;
  }
  /**
   * 注册
   */
  async registerHandler() {
    let _self = this;
    let res: IndexModel.RegisterModel = await Container.get<IndexService>("indexservice").register(_self.register_user_name, _self.register_password)
    if (res.code === 10000) {
      _self.registerModal = !_self.registerModal;
    } else if (res.code === 20001) {
      _self.registerTips = true;
    }
  }
  /**
   * 登录
   */
  async loginHandler() {
    let _self = this;
    let res: IndexModel.loginModel = await Container.get<IndexService>("indexservice").login(_self.login_user_name, _self.login_password);
    if (res.code === 10000) {
      _self.loginModal = !_self.loginModal;
    } else if (res.code === 20001) {
      _self.loginTips = true;
    }
  }
  /**
   * 上传图片
   */
  async uploadHandler() {
    let _self = this;
    let form: any = new FormData();
    if (_self.uploading) return;
    _self.uploading = true;
    form.append('filename', _self.file);
    let res: IndexModel.UploadModel = await Container.get<IndexService>("indexservice").upload(form)
    if (res.code === 10000) {
      _self.uploading = false;
    }
  }
}