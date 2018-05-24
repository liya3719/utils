<template lang="jade">
  .list
    h3.title 图片列表
    .image-list
      .sub-title.clearfix
        .number 编号
        .url 链接地址
        .thumbnail 缩略图
      .item.clearfix(v-for="item,index in imgList") 
        .number {{index}}
        .url 
          a(:href="item.image_url") {{item.image_url}}
        .thumbnail
          img(:src="item.image_url")
    <SliderNav></SliderNav>
</template>

<style lang="less">
@import "./app.less";
</style>

<script lang="ts" src="./app.ts">
</script>