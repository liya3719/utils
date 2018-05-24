/**
 * 左侧收缩导航组件
 */
import Vue from 'vue';
import {
  Component,
  Emit,
  Inject,
  Model,
  Prop,
  Provide,
  Watch
} from "vue-property-decorator";

@Component
export default class SliderNav extends Vue {
    switchText: string = '展开'
    isAnimate: boolean = false
    switchNav() {
      this.isAnimate = !this.isAnimate;
      if(this.isAnimate) {
        this.switchText = '收起'
      } else {
        this.switchText = '展开'
      }
    }
}