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
import commonService from '../../common/common';
const utils = require('heibao-utils');
const CommonService = new commonService();

@Component({
  components: { SliderNav }
})
export default class uploadView extends BaseView {
  id: number = 0;
  imageName: string = '';
  isLogin: boolean = false;
  userName: string = '';
  loginModal: boolean = false;
  registerModal: boolean = false;
  login_user_name: string = '';
  login_password: any = '';
  register_user_name: string = '';
  register_password: any = '';
  uploading: boolean = false;
  registerTips: boolean = false;
  loginTips: boolean = false;
  syncStatus: boolean = false;
  userId: number;
  file: any;
  mounted() {
    this.init();
  }
  /**
   * 页面初始化操作
   */
  init() {
    this.getUserId();
    let userName = this.getUserName();
    if (!this.userId) {
      this.loginModal = !this.loginModal;
    }
    if (userName) {
      this.userName = userName;
      this.isLogin = true;
    }
  }
  /**
   * 上传图片
   * @param event input file 
   */
  uploadImgHandler(e) {
    this.file = e.target.files[0];
    this.imageName = `您即将上传的图片： ${e.target.files[0].name}`;
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
   * 获取浏览器cookie
   */
  getUserId() {
    let id = CommonService.getCookie('user_id');
    this.userId = Number(CommonService.getCookie('user_id'));
  }
  /**
   * 获取本地保存的用户名
   */
  getUserName() {
    let userName = sessionStorage.getItem('user_name');
    return userName;
  }
  /**
   * 注册
   */
  async registerHandler() {
    let _self = this;
    let res: IndexModel.RegisterModel = await Container.get<IndexService>("indexservice").register(_self.register_user_name, _self.register_password)
    if (res.code === 10000) {
      _self.registerModal = false;
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
      _self.loginModal = false;
      _self.isLogin = true;
      //@ts-ignore
      _self.userName = res.user_name;
      //@ts-ignore
      sessionStorage.setItem('user_name', res.user_name)
    } else if (res.code === 20001) {
      _self.loginTips = true;
      _self.isLogin = true;
    }
  }
  /**
   * 上传图片
   */
  async uploadHandler() {
    let _self = this;
    let form: any = new FormData();
    form.append('filename', _self.file);
    if (Object.prototype.toString.call(form.get('filename')) === '[object String]') {
      alert('请选择上传的图片')
      return false;
    }
    if (_self.uploading) return;
    _self.uploading = true;
    let res: IndexModel.UploadModel = await Container.get<IndexService>("indexservice").upload(form)
    if (res.code === 20009) {
      alert(res.message);
      _self.imageName = '';
      _self.uploading = false;
    } else if (res.code === 10000) {
      alert(res.message);
      _self.imageName = '';
      _self.uploading = false;
    } else if (res.code === 20001) {
      alert(res.message);
      _self.imageName = '';
      _self.uploading = false;
    } else if (res.code === 20008) {
      alert(res.message);
      _self.imageName = '';
      _self.uploading = false;
    }
  }
  /**
   * 同步到gitlab
   */
  async syncGitlabHandler() {
    let _self = this;
    if (!_self.syncStatus) {
      _self.syncStatus = true;
      let res: any = await Container.get<IndexService>('indexservice').syncGitlab();
      if (res.code === 10000) {
        _self.syncStatus = false;
        alert(res.message);
      } else {
        _self.syncStatus = false;
        alert(res.message);
      }
    }
  }
}