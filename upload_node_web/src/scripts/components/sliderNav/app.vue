<template lang="jade">
  .slider-nav(:class="[isAnimate ? 'animate': '']")
    ul
      li
        a(href="/upload") 首页
      li
        a(href="/images/list") 图片列表
    .switch(@click="switchNav") {{ switchText }}
</template>
<style lang="less">
  @import "./app.less";
</style>
<script lang="ts" src="./app.ts"></script>
