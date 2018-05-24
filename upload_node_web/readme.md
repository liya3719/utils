### 项目简介

上传图片到gitlab或者cdn，使用ts+vue搭建的项目框架

### 特点

- 使用vue框架，告别琐碎操作dom的时代
- 使用ts框架，拥抱强类型时代
- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便
- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好
- webpack构建，紧跟前端模块化、组件化进程

### 项目结构简介

```
|-common 存放项目公用代码
|-components 存放项目公用组件
|-entry 各个页面的入口文件，webpack编译入口
|-interface 存放接口文件目录
|-models 存放业务实体目录
|-services 各个api接口服务
|-views 存放各个页面
```

### 运行项目

#### 安装依赖

```
cnpm install
```

#### 开发

```
npm run dev
```

#### 发布编译

```
npm run build
```
#### 运行build以后的项目

```
npm run serve
```

