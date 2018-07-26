#### 发布资源中间件

###### 简介

  ```
    发布中间件主要解决手动更新上线出现遗漏文件的情况，只需要选择发布的环境，即可完成从gitlab创建发布分支、提交代码、发起merge request操作
  ```

###### 功能

  ``` 
    一键发布资源到测试环境/生产环境/
    适用于紧急上线
    对上线前原gitlab仓库进行本地备份
  ```

###### 使用

  ```
    1. 先把此中间件install到要发布的项目
    1. 在本项目的根目录下新建文件 publish.js
    2. publish.js 引入freedom-middleware-publish，详情参照test.js
    3. 执行node publish.js
  ```
###### 其他
  
  ```
    1. 发布到nat/test测试环境 请选择nat/test选项
    2. 发布合并到到master分支 请选择master选项
    3. 发布到fe-online release分支(正常上线) 请选择release选项
    4. 发布到fe-online hotfix分支(紧急上线) 请选择hotfix选项
  ```
###### 版本更新
  
  ```
    1. 新增发布到relaese和hotfix分支对当前分支上线文件的备份
  ```