import axios from 'axios';
import { Service } from 'typedi';
import { IndexInterface } from '../interface/Iindex';
@Service('indexservice')

export class IndexService implements IndexInterface {
  /**
   * 登录接口
   * @param user_name 邮箱 
   * @param password 密码
   */
  async login(user_name: string, password: any): Promise<any> {
    return new Promise((resolve, reject) => {
      axios({
        url: '/api/login',
        method: 'POST',
        headers: { 'X-Requested-Width': 'XMLHttpRequest' },
        data: {
          "user_name": user_name,
          "password": password
        }
      }).then((res) => {
        resolve(res.data)
      })
    })
  }
  /**
   * 注册
   * @param user_name 邮箱
   * @param password 密码
   */
  async register(user_name: string, password: any): Promise<any> {
    return new Promise((resolve, reject) => {
      axios({
        url: '/api/register',
        method: 'POST',
        headers: { 'X-Requested-Width': 'XMLHttpRequest' },
        data: {
          "user_name": user_name,
          "password": password
        }
      }).then((res) => {
        resolve(res.data);
      })
    })
  }
  /**
   * 上传
   */
  async upload(data: any): Promise<any> {
    return new Promise((resolve, reject) => {
      axios({
        url: '/api/upload',
        method: 'POST',
        data: data,
        headers: { 'Content-Type': 'multipart/form-data' }
      }).then((res) => {
        resolve(res.data);
      })
    })
  }
}