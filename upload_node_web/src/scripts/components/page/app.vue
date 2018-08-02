<template lang="jade">
  .page-component
    ul 
      li.item.prev(:class="{'disable': index === 1}",@click="prev") prev
      li.item.first(@click="first") first
      li.item(:class="{'current' : index == page}", v-for="page in prePage", @click="go(page)") {{page}}
      li.item.last(@click="last") last
      li.item.next(@click="next") next
</template>

<style lang="less">
@import "./app.less";
</style>
<script lang="ts" src="./app.ts"></script>