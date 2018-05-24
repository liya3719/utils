<template lang="jade">
  .upload
    .upload-topbar
      .upload-topbar__login(@click="showLoginModal") 登录
      .upload-topbar__register(@click="showRegisterModal") 注册
    .upload-wrap
      .upload-wrap__input
        input(type="file", id="upload", @change="uploadImgHandler")
      .upload-wrap__btn(@click="uploadHandler") 上传
    <SliderNav></SliderNav>
    .mask(v-show = 'loginModal || registerModal')
      .login-layout.modal(v-show="loginModal")
        .close(@click="showLoginModal") 关闭
        h4.title 登录
        .form
          ul
            li
              label 用户名
              input(type="text", v-model="login_user_name", id="login_user_name", placeholder="请输入邮箱地址")
            li
              label 密码
              input(type="password", v-model="login_password", id="login_password", placeholder="请输入密码")
          .tips(v-show="loginTips") 用户未登录，去 <span @click="switchDialogModal">注册</span>
          .submit(@click="loginHandler") 登录
      .register-layout.modal(v-show="registerModal")
        h4.title 注册
        .close(@click="showRegisterModal") 关闭
        .form
          ul
            li
              label 用户名
              input(type="text", v-model="register_user_name", id="register_user_name", placeholder="请输入邮箱地址")
            li
              label 密码
              input(type="password", v-model="register_password", id="register_password", placeholder="请输入密码")
          .tips(v-show="registerTips") 用户已注册，去<span @click="switchDialogModal">登录</span>
          .submit(@click="registerHandler") 注册
</template>
<style lang="less">
@import "./app.less";
</style>
<script lang="ts" src="./app.ts"></script>
