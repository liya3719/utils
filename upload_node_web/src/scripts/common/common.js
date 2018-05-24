/**
 * 一些公用方法
 */
export default class commonService {
  /**
   * 获取cookie
   * @param {key} 获取的cookie关键字
   */
  getCookie(key) {
    var cookieArr = document.cookie.split(';');
    for (var i = 0; i < cookieArr.length; i++) {
      var arr = cookieArr[i].split('=');
      if (arr[0] === key) {
        return arr[1];
      }
    }
    return false;
  }
}