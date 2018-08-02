/**
 * 分页组件
 */
import Vue from 'vue';
import {
  Component,
  Prop,
  Watch,
  Emit
} from "vue-property-decorator";

@Component
export default class pageComponent extends Vue {

  @Prop(Number) prePage!: number;
  @Prop(Number) pageIndex!: number;
  @Prop({ default: 10 }) pageSize!: number;
  @Prop({ default: 1 }) total!: number;

  index:number = this.pageIndex;
  prev() {
    if (this.pageIndex > 1) {
      this.go(this.pageIndex - 1);
    }
  }
  next() {
    if (this.pageIndex < this.prePage) {
      this.go(this.pageIndex + 1);
    }
  }
  first() {
    if (this.pageIndex != 1) {
      this.go(1);
    }
  }
  last() {
    if (this.pageIndex != this.prePage) {
      this.go(this.prePage);
    }
  }
  @Emit('emitPage')
  go(page) {
    if (this.pageIndex !== page) {
      this.pageIndex = page;
    }
  }
  @Watch('pageIndex')
  setIndex(val) {
    this.index = val || 1;
  }
}