#### 自动更新测试环境代码


##### 简介

  ```
    解决提交代码到gitlab后，本地测试环境代码不会自动拉取更新，需要手动更新的情况
  ```

##### 使用

  ```
    1、下载webhook此包到测试服务器
    2、配置gitlab：选择项目 ——> setting ——> Integrations，在URL输入框内填写请求的url（例如：http://172.16.12.123:7777/webhook1）,Secret Token输入框内填写对应
    项目名(例如：test)，这样gitlab配置就完成了。需要注意的地方, deploy.js第五行 secret字段需要跟Secret Token输入框填写的一致。
    3、测试服务器nginx配置：vim nginx配置文件，添加一句
    location ~/webhook/ {
          alias /data/webhook/; (webhook包所在的测试服务器地址)
    }
    保存配置文件，重启nginx服务(进入到sbin目录 ./nginx -s reload);
    4、使用pm2守护webhook服务
  ```