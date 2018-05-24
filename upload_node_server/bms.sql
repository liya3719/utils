/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.17-log : Database - bms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bms`;

/*Table structure for table `bms_master` */

DROP TABLE IF EXISTS `bms_master`;

CREATE TABLE `bms_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `name` varchar(100) NOT NULL COMMENT '母版页名称',
  `description` varchar(150) DEFAULT NULL COMMENT '母版页描述',
  `content` text NOT NULL COMMENT '母版页内容',
  `create_author` varchar(20) DEFAULT NULL COMMENT '母版页创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '母版页创建时间',
  `update_author` varchar(20) DEFAULT NULL COMMENT '母版页更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '母版页更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bms_master` */

insert  into `bms_master`(`id`,`user_id`,`name`,`description`,`content`,`create_author`,`create_time`,`update_author`,`update_time`) values (1,0,'我创建的通用母版','这个母版全站所有页面使用','<!DOCTYPE html>\n\n<html lang=\"en\">\n\n<head>\n\n <meta charset=\"UTF-8\">\n\n <meta name=\"keyword\" content=\"积木世界，积木\">\n\n <meta name=\"description\" content=\"积木世界，积木\">\n\n <title>积木世界</title>\n\n</head>\n\n<body>\n\n <div class=\"main\" place=\"first\">\n\n </div>\r\n <div class=\"left\"></div>\n <div class=\"right\" place=\"second\">\r\n\r\n </div>\n</body>\n</html>','上善若水',1521110809,'上善若水',1521110809),(2,0,'我创建的移动站通用母版','这个母版移动端全站所有页面使用','<!DOCTYPE html>\n\n<html lang=\"en\">\n\n<head>\n\n <meta charset=\"UTF-8\">\n\n <meta name=\"keyword\" content=\"积木世界，积木\">\n\n <meta name=\"description\" content=\"积木世界，积木\">\n\n <title>积木世界</title>\n\n</head>\n\n<body>\n\n <div class=\"main\" place>\n  <div></div>\n </div>\n\n</body>\n</html>','上善若水',1521170062,NULL,1521170568);

/*Table structure for table `bms_module` */

DROP TABLE IF EXISTS `bms_module`;

CREATE TABLE `bms_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模块主键，自增字段',
  `name` varchar(100) NOT NULL COMMENT '模块名称',
  `version` char(10) NOT NULL COMMENT '模块版本',
  `description` varchar(200) NOT NULL COMMENT '模块描述',
  `thumb` varchar(500) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL COMMENT '模块的gitlab项目id',
  `readme` text COMMENT '模块的readme信息，记录模块的功能等信息',
  `create_author` varchar(20) DEFAULT NULL COMMENT '模块的创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '模块的创建时间',
  `update_author` varchar(20) DEFAULT NULL COMMENT '模块的更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '模块的更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `bms_module` */

insert  into `bms_module`(`id`,`name`,`version`,`description`,`thumb`,`project_id`,`readme`,`create_author`,`create_time`,`update_author`,`update_time`) values (1,'ejs-component-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(2,'block-heibao-login','0.0.2','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(3,'block-heibao-swiperV2','0.0.1','图片轮播滑第二版','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(4,'block-heibao-loginV2','0.0.1','全站登录模块第二版','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(5,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(6,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(7,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(8,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(9,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(10,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(11,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(12,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(13,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(14,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041),(15,'block-heibao-swiper','0.0.2','图片轮播滑','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',1324242,'### 项目介绍\r\n\r\n一个积木堆积式快速搭建页面的内容发布系统。项目架构基于Typescript、koa2搭建，使得开发应用变得几乎跟java类似，强类型的使用使得我们能更方便的维护应用业务逻辑，编译阶段即可发现潜在的由于类型使用不正确而导致的应用错误\r\n\r\n#### 特点\r\n\r\n- 引入Typescript，开发使用强类型，开发上更直观，业务逻辑呈现更清晰，维护更好\r\n- 引入依赖注入，开发完全面向接口，功能模块之间耦合更低\r\n- 按照后端开发习惯，划分Controller、Service、DataAccess、Web等，更接近后端开发模式，完全面向对象\r\n- 使用TJ大神的koa2这个nodejs的开发框架\r\n\r\n### 项目相关设计\r\n\r\n- [数据库设计](https://gitlab.com/heibao/bms-node/blob/master/docs/dataBaseDesign.md)\r\n- [bms系统结构说明](https://gitlab.com/heibao/bms-node/blob/master/docs/system.md)\r\n- [freedom-cli设计](https://gitlab.com/heibao/bms-node/blob/master/docs/freedom.md)\r\n- [bms-api接口定义](https://gitlab.com/heibao/bms-node/blob/master/docs/bms-api.md)\r\n- [前端规划](https://gitlab.com/heibao/bms-node/blob/master/docs/images/fe-schedule.jpg)。\r\n\r\n\r\n### 使用\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 更新依赖包devtool的electron依赖\r\n\r\n由于开发使用了devtool包，而该包依赖的electron不支持async、await这些特性，需要更新electron\r\n\r\n```\r\ncd node_modules/devtool\r\ncnpm install electron@1.7.2 --save\r\n```\r\n\r\n#### 执行开发命令\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n### 备注\r\n\r\n- **由于项目接入了mysql，所以开发前请务必安装了mysql数据库，并且修改项目根目录下面的config/dev.js上面的数据库配置，以及在本地建立logs存放目录**\r\n- **node版本建议>=8.9.0**','上善如水',1518532041,'heibao',1518532041),(16,'block-heibao-login','0.0.1','全站登录模块','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521205362817&di=4544f0ead745e6a9dbae760bc17c65a2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D0d604f7ada160924c828aa58bc6e5f8f%2Faa18972bd40735fa5d50669594510fb30f24087d.jpg',4533535,'### 项目简介\r\n\r\n项目承载的是积木系统UI端相关功能模块，以单页应用构建\r\n\r\n### 特点\r\n\r\n- 使用vue框架，告别琐碎操作dom的时代\r\n- 使用ts框架，拥抱强类型时代\r\n- 面向对象，面向接口编程，使得项目业务逻辑更清晰，扩展更好，维护更方便\r\n- 加入依赖注入，使得上传功能依赖于接口，而不依赖于实现，扩展，维护更好\r\n- webpack构建，紧跟前端模块化、组件化进程\r\n\r\n### 项目结构简介\r\n\r\n```\r\n|-common 存放项目公用代码\r\n|-components 存放项目公用组件\r\n|-entry 各个页面的入口文件，webpack编译入口\r\n|-interface 存放接口文件目录\r\n|-models 存放业务实体目录\r\n|-services 各个api接口服务\r\n|-views 存放各个页面\r\n```\r\n\r\n### 运行项目\r\n\r\n#### 安装依赖\r\n\r\n```\r\ncnpm install\r\n```\r\n\r\n#### 开发\r\n\r\n```\r\nnpm run dev\r\n```\r\n\r\n#### 发布编译\r\n\r\n```\r\nnpm run build\r\n```\r\n#### 运行build以后的项目\r\n\r\n```\r\nnpm run serve\r\n```\r\n\r\n','虚怀若谷',1518532041,'heibao',1518532041);

/*Table structure for table `bms_module_versioninfo` */

DROP TABLE IF EXISTS `bms_module_versioninfo`;

CREATE TABLE `bms_module_versioninfo` (
  `module_id` bigint(20) NOT NULL COMMENT '模块主键',
  `module_version` char(10) NOT NULL COMMENT '模块版本',
  `main` char(20) NOT NULL COMMENT '模块的执行入口文件名称',
  `data` text COMMENT '模块的mock数据',
  `module_address` varchar(200) NOT NULL COMMENT '模块的源码存放地址',
  `schema_desc` text COMMENT '模块的schema描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bms_module_versioninfo` */

insert  into `bms_module_versioninfo`(`module_id`,`module_version`,`main`,`data`,`module_address`,`schema_desc`) values (1,'0.0.1','index.js','[\r\n      {\r\n        \"banner\": \"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521881083275&di=92c9157902df64e54d1f5eb73359321f&imgtype=0&src=http%3A%2F%2Ffucome.cn%2FContent%2FUploadFiles%2F00%2F00%2F00%2F41.jpg\"\r\n      },\r\n      {\r\n        \"banner\":\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521883963316&di=5411543ef4fbbdc4989e5b3519b7624c&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F4bed2e738bd4b31cdfae124980d6277f9f2ff8b6.jpg\"\r\n      },\r\n      {\r\n        \"banner\":\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521884005991&di=97ff86bd27990b73229958bc3fb737ce&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0159aa592ad8e5a801216a3e54aa95.jpg\"\r\n      }\r\n    ]','/modules','{\r\n  \"title\":\"轮播模块\",\r\n  \"type\":\"array\",\r\n  \"items\":{\r\n    \"title\":\"轮播模块的每一项\",\r\n    \"type\":\"object\",\r\n    \"properties\":{\r\n      \"banner\":{\r\n        \"type\":\"string\",\r\n        \"title\":\"轮播图url\"\r\n      }\r\n    }\r\n  }\r\n}'),(1,'0.0.2','index.js','[\r\n      {\r\n        \"banner\": \"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521881083275&di=92c9157902df64e54d1f5eb73359321f&imgtype=0&src=http%3A%2F%2Ffucome.cn%2FContent%2FUploadFiles%2F00%2F00%2F00%2F41.jpg\"\r\n      },\r\n      {\r\n        \"banner\":\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521883963316&di=5411543ef4fbbdc4989e5b3519b7624c&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F4bed2e738bd4b31cdfae124980d6277f9f2ff8b6.jpg\"\r\n      },\r\n      {\r\n        \"banner\":\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521884005991&di=97ff86bd27990b73229958bc3fb737ce&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0159aa592ad8e5a801216a3e54aa95.jpg\"\r\n      }\r\n    ]','/modules','{\r\n  \"title\":\"轮播模块\",\r\n  \"type\":\"array\",\r\n  \"items\":{\r\n    \"title\":\"轮播模块的每一项\",\r\n    \"type\":\"object\",\r\n    \"properties\":{\r\n      \"banner\":{\r\n        \"type\":\"string\",\r\n        \"title\":\"轮播图url\"\r\n      }\r\n    }\r\n  }\r\n}'),(2,'0.0.2','index.js','','1518532041','heibao'),(3,'0.0.1','index.js','','1518532041','heibao'),(4,'0.0.1','index.js','','1518532041','heibao'),(2,'0.0.1','index.js','','1518532041','heibao');

/*Table structure for table `bms_page` */

DROP TABLE IF EXISTS `bms_page`;

CREATE TABLE `bms_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `master_id` int(11) DEFAULT NULL COMMENT '母版页ID',
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(200) NOT NULL COMMENT '页面访问的url，唯一不重复',
  `type` int(11) NOT NULL COMMENT '页面类型，1：频道，2：区块',
  `device` int(11) NOT NULL COMMENT '页面终端,1、pc，2：iphone(移动)',
  `title` varchar(100) NOT NULL COMMENT '页面标题，放在页面的title标签中',
  `description` varchar(400) NOT NULL COMMENT '页面描述，页面meta字段',
  `keyword` varchar(400) NOT NULL COMMENT '页面关键字，页面的meta',
  `is_delete` tinyint(1) NOT NULL COMMENT '页面软删除表示，默认为false',
  `create_author` varchar(20) DEFAULT NULL COMMENT '页面创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '页面创建时间',
  `update_author` varchar(20) DEFAULT NULL COMMENT '页面更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '页面更新时间',
  `publisher` varchar(20) DEFAULT NULL COMMENT '页面发布者',
  `publish_time` int(11) DEFAULT NULL COMMENT '页面发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `bms_page` */

insert  into `bms_page`(`id`,`user_id`,`master_id`,`name`,`url`,`type`,`device`,`title`,`description`,`keyword`,`is_delete`,`create_author`,`create_time`,`update_author`,`update_time`,`publisher`,`publish_time`) values (1,0,1,'再次修改上善若水的测试页面','http://www.heibao.com/solutions/block',2,2,'上善若水','非常牛逼的pc端适配模块','积木系统哈哈',0,'上善若水',1504025238,'0',1504160770,'虚怀若谷',1518532041),(2,0,1,'页面名称-11','http://www.heibao.com/index1-niubi',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057748,'上善若水',1504057748,'虚怀若谷',1518532041),(3,0,1,'我修改了页面名称-22','http://www.heibao.com/index2',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057759,NULL,1521016681,'虚怀若谷',1518532041),(4,0,2,'页面名称-t33','http://www.heibao.com/index3',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057763,'上善若水',1504057763,'虚怀若谷',1518532041),(5,0,2,'页面名称-test44','http://www.heibao.com/index4',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057766,'上善若水',1504057766,'虚怀若谷',1518532041),(6,0,2,'页面名称-te3','http://www.heibao.com/index5',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057770,'上善若水',1504057770,'虚怀若谷',1518532041),(7,0,1,'页面名称-t6','http://www.heibao.com/index31',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058181,'上善若水',1504058181,'虚怀若谷',1518532041),(8,0,1,'页面名称-t7','http://www.heibao.com/index32',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058187,'上善若水',1504058187,'虚怀若谷',1518532041),(9,0,2,'页面名称-t8','http://www.heibao.com/index33',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058192,'上善若水',1504058192,'虚怀若谷',1518532041),(10,0,1,'页面名称-t9','http://www.heibao.com/index331',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058195,'上善若水',1504058195,'虚怀若谷',1518532041),(11,0,2,'页面名称-t10','http://www.heibao.com/index3311',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058197,'上善若水',1504058197,'虚怀若谷',1518532041),(12,0,1,'页面名称-t11','http://www.heibao.com/index33111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058201,'上善若水',1504058201,'虚怀若谷',1518532041),(13,0,2,'页面名称-t12','http://www.heibao.com/index331111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058203,NULL,1521172771,NULL,NULL),(14,0,2,'页面名称-t13','http://www.heibao.com/index3311111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058205,'上善若水',1504058205,NULL,NULL),(15,0,2,'页面名称-te14','http://www.heibao.com/index33111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058207,'上善若水',1504058207,NULL,NULL),(16,0,5,'页面名称-te15','http://www.heibao.com/index331111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058210,'上善若水',1504058210,NULL,NULL),(17,0,2,'页面名称-teq16','http://www.heibao.com/index3311111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058212,'上善若水',1504058212,NULL,NULL),(18,0,2,'页面名称-test17','http://www.heibao.com/index3311/111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058217,'上善若水',1504058217,NULL,NULL),(19,0,2,'页面名称-test18','http://www.heibao.com/index3311/1111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058219,'上善若水',1504058219,NULL,NULL),(20,0,2,'页面名称-test19','http://www.heibao.com/index3311/1111/111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058222,'上善若水',1504058222,NULL,NULL),(21,0,2,'页面名称-test20','http://www.heibao.com/index3311/1111/1111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058241,'上善若水',1504058241,NULL,NULL),(22,0,1,'页面名称-test21','http://www.heibao.com/index3311/1111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058243,'上善若水',1504058243,NULL,NULL),(23,0,2,'页面名称-test22','http://www.heibao.com/index3311/11111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058244,'上善若水',1504058244,NULL,1518532041),(24,0,1,'页面名称-test23','http://www.heibao.com/index3311/111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058246,'上善若水',1504058246,NULL,1518532041),(25,0,1,'页面名称-test24','http://www.heibao.com/index3311/1111/11/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058250,'上善若水',1504058250,NULL,1518532041),(26,0,1,'页面名称-test25','http://www.heibao.com/index3311/1111/111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058252,'上善若水',1504058252,NULL,1518532041),(27,0,1,'页面名称-test26','http://www.heibao.com/index3311/1111/1111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058254,'上善若水',1504058254,'虚怀若谷',1518532041),(28,0,2,'页面名称-test27','http://www.heibao.com/index3311/1111/11111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058256,'上善若水',1504058256,'虚怀若谷',1518532041),(29,0,1,'页面名称-test28','http://www.heibao.com/index3311/11111/11111/11111',1,1,'页面标题','这是一个很牛逼的页面','这是一个很牛逼的页面',0,'上善若水',1504058258,NULL,1521172908,'虚怀若谷',1518532041),(30,0,2,'页面名称-test29','http://www.heibao.com/index3311/11111/111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058260,'上善若水',1504058260,'虚怀若谷',1518532041),(31,0,2,'页面名称-test30','http://www.heibao.com/index3311/11111/1111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058262,'上善若水',1504058262,'虚怀若谷',1518532041),(32,0,1,'我复制创建了了页面名称-22','http://www.heibao.com/index2hello',1,1,'页面标题','页面描述','页面关键字',1,'上善若水',1521018883,'上善若水',1521018883,'虚怀若谷',1518532041),(33,0,2,'我在系统创建的页面','/block/page/dafd',2,2,'大发大水','大嘎达是发生的','大发大水',0,'上善若水',1521019934,NULL,1521172776,'虚怀若谷',1518532041),(34,0,2,'我再次创建','/dfdf/dfdsfa',1,1,'打打分','打打分','打打分',0,'上善若水',1521020743,NULL,1521172714,'虚怀若谷',1518532041);

/*Table structure for table `bms_page_moduleinfo` */

DROP TABLE IF EXISTS `bms_page_moduleinfo`;

CREATE TABLE `bms_page_moduleinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `page_id` bigint(20) NOT NULL COMMENT '页面ID',
  `master_id` int(11) DEFAULT NULL COMMENT '母版页ID',
  `module_id` bigint(20) NOT NULL COMMENT '模块主键',
  `module_version` char(10) NOT NULL COMMENT '模块版本',
  `data` text COMMENT '模块数据，运营投放的数据',
  `placeholder` char(50) DEFAULT NULL COMMENT '模块在母版页的位置',
  `sort` int(11) NOT NULL COMMENT '模块在页面中的序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bms_page_moduleinfo` */

/*Table structure for table `bms_page_moduleinfo_history` */

DROP TABLE IF EXISTS `bms_page_moduleinfo_history`;

CREATE TABLE `bms_page_moduleinfo_history` (
  `publish_id` bigint(20) NOT NULL COMMENT '发布ID',
  `page_id` bigint(20) NOT NULL COMMENT '页面ID',
  `master_id` int(11) DEFAULT NULL COMMENT '母版页ID,当该值存在，则placeholder非空',
  `module_id` bigint(20) NOT NULL COMMENT '模块ID',
  `module_version` char(10) NOT NULL COMMENT '模块版本',
  `data` text COMMENT '模块的数据',
  `placeholder` char(20) DEFAULT NULL COMMENT '模块在母版页的位置',
  `sort` int(11) NOT NULL COMMENT '模块在页面的序号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bms_page_moduleinfo_history` */

/*Table structure for table `bms_page_publish` */

DROP TABLE IF EXISTS `bms_page_publish`;

CREATE TABLE `bms_page_publish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `page_id` bigint(20) NOT NULL COMMENT '页面ID',
  `page_name` varchar(200) NOT NULL COMMENT '页面名称',
  `env` int(11) NOT NULL COMMENT '页面发布环境，1:预发环境，2：生产环境',
  `publish_author` varchar(20) DEFAULT NULL COMMENT '页面发布者',
  `publish_time` int(11) DEFAULT NULL COMMENT '页面发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bms_page_publish` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.17-log : Database - bms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bms`;

/*Table structure for table `bms_page` */

DROP TABLE IF EXISTS `bms_page`;

CREATE TABLE `bms_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `website_id` bigint(20) DEFAULT NULL COMMENT '所属站点',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `master_id` int(11) DEFAULT NULL COMMENT '母版页ID',
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(200) NOT NULL COMMENT '页面访问的url，唯一不重复',
  `type` int(11) NOT NULL COMMENT '页面类型，1：频道，2：区块',
  `device` int(11) NOT NULL COMMENT '页面终端,1、pc，2：iphone(移动)',
  `title` varchar(100) NOT NULL COMMENT '页面标题，放在页面的title标签中',
  `description` varchar(400) NOT NULL COMMENT '页面描述，页面meta字段',
  `keyword` varchar(400) NOT NULL COMMENT '页面关键字，页面的meta',
  `is_delete` tinyint(1) NOT NULL COMMENT '页面软删除表示，默认为false',
  `create_author` varchar(20) DEFAULT NULL COMMENT '页面创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '页面创建时间',
  `update_author` varchar(20) DEFAULT NULL COMMENT '页面更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '页面更新时间',
  `publisher` varchar(20) DEFAULT NULL COMMENT '页面发布者',
  `publish_time` int(11) DEFAULT NULL COMMENT '页面发布时间',
  `is_design` tinyint(1) DEFAULT '0' COMMENT '页面是否已经设计过，默认为0，没有设计过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `bms_page` */

insert  into `bms_page`(`id`,`website_id`,`user_id`,`master_id`,`name`,`url`,`type`,`device`,`title`,`description`,`keyword`,`is_delete`,`create_author`,`create_time`,`update_author`,`update_time`,`publisher`,`publish_time`,`is_design`) values (1,1,0,1,'再次修改上善若水的测试页面','http://www.heibao.com/solutions/block',2,2,'上善若水','非常牛逼的pc端适配模块','积木系统哈哈',0,'上善若水',1504025238,'0',1504160770,'虚怀若谷',1518532041,1),(2,1,0,1,'页面名称-11','http://www.heibao.com/index1-niubi',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057748,'上善若水',1504057748,'虚怀若谷',1518532041,0),(3,1,0,1,'我修改了页面名称-22','http://www.heibao.com/index2',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057759,NULL,1521016681,'虚怀若谷',1518532041,0),(4,1,0,2,'页面名称-t33','http://www.heibao.com/index3',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057763,'上善若水',1504057763,'虚怀若谷',1518532041,0),(5,1,0,2,'页面名称-test44','http://www.heibao.com/index4',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057766,'上善若水',1504057766,'虚怀若谷',1518532041,0),(6,1,0,2,'页面名称-te3','http://www.heibao.com/index5',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504057770,'上善若水',1504057770,'虚怀若谷',1518532041,0),(7,1,0,1,'页面名称-t6','http://www.heibao.com/index31',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058181,'上善若水',1504058181,'虚怀若谷',1518532041,0),(8,1,0,1,'页面名称-t7','http://www.heibao.com/index32',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058187,'上善若水',1504058187,'虚怀若谷',1518532041,0),(9,1,0,2,'页面名称-t8','http://www.heibao.com/index33',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058192,'上善若水',1504058192,'虚怀若谷',1518532041,0),(10,1,0,1,'页面名称-t9','http://www.heibao.com/index331',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058195,'上善若水',1504058195,'虚怀若谷',1518532041,0),(11,1,0,2,'页面名称-t10','http://www.heibao.com/index3311',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058197,'上善若水',1504058197,'虚怀若谷',1518532041,0),(12,1,0,1,'页面名称-t11','http://www.heibao.com/index33111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058201,'上善若水',1504058201,'虚怀若谷',1518532041,0),(13,1,0,2,'页面名称-t12','http://www.heibao.com/index331111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058203,NULL,1521172771,NULL,NULL,0),(14,1,0,2,'页面名称-t13','http://www.heibao.com/index3311111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058205,'上善若水',1504058205,NULL,NULL,0),(15,1,0,2,'页面名称-te14','http://www.heibao.com/index33111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058207,'上善若水',1504058207,NULL,NULL,0),(16,1,0,5,'页面名称-te15','http://www.heibao.com/index331111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058210,'上善若水',1504058210,NULL,NULL,0),(17,1,0,2,'页面名称-teq16','http://www.heibao.com/index3311111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058212,'上善若水',1504058212,NULL,NULL,0),(18,1,0,2,'页面名称-test17','http://www.heibao.com/index3311/111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058217,'上善若水',1504058217,NULL,NULL,0),(19,1,0,2,'页面名称-test18','http://www.heibao.com/index3311/1111111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058219,'上善若水',1504058219,NULL,NULL,0),(20,1,0,2,'页面名称-test19','http://www.heibao.com/index3311/1111/111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058222,'上善若水',1504058222,NULL,NULL,1),(21,1,0,2,'页面名称-test20','http://www.heibao.com/index3311/1111/1111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058241,'上善若水',1504058241,NULL,NULL,0),(22,1,0,1,'页面名称-test21','http://www.heibao.com/index3311/1111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058243,'上善若水',1504058243,NULL,NULL,0),(23,1,0,2,'页面名称-test22','http://www.heibao.com/index3311/11111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058244,'上善若水',1504058244,NULL,1518532041,0),(24,1,0,1,'页面名称-test23','http://www.heibao.com/index3311/111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058246,'上善若水',1504058246,NULL,1518532041,0),(25,1,0,1,'页面名称-test24','http://www.heibao.com/index3311/1111/11/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058250,'上善若水',1504058250,NULL,1518532041,0),(26,1,0,1,'页面名称-test25','http://www.heibao.com/index3311/1111/111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058252,'上善若水',1504058252,NULL,1518532041,0),(27,1,0,1,'页面名称-test26','http://www.heibao.com/index3311/1111/1111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058254,'上善若水',1504058254,'虚怀若谷',1518532041,0),(28,1,0,2,'页面名称-test27','http://www.heibao.com/index3311/1111/11111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058256,'上善若水',1504058256,'虚怀若谷',1518532041,0),(29,1,0,1,'页面名称-test28','http://www.heibao.com/index3311/11111/11111/11111',1,1,'页面标题','这是一个很牛逼的页面','这是一个很牛逼的页面',0,'上善若水',1504058258,NULL,1521172908,'虚怀若谷',1518532041,0),(30,1,0,2,'页面名称-test29','http://www.heibao.com/index3311/11111/111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058260,'上善若水',1504058260,'虚怀若谷',1518532041,0),(31,1,0,2,'页面名称-test30','http://www.heibao.com/index3311/11111/1111111/11111',1,1,'页面标题','页面描述','页面关键字',0,'上善若水',1504058262,'上善若水',1504058262,'虚怀若谷',1518532041,1),(32,1,0,1,'我复制创建了了页面名称-22','http://www.heibao.com/index2hello',1,1,'页面标题','页面描述','页面关键字',1,'上善若水',1521018883,'上善若水',1521018883,'虚怀若谷',1518532041,0),(33,1,0,2,'我在系统创建的页面','/block/page/dafd',2,2,'大发大水','大嘎达是发生的','大发大水',0,'上善若水',1521019934,NULL,1521172776,'虚怀若谷',1518532041,1),(34,1,0,2,'我再次创建','/dfdf/dfdsfa',1,1,'打打分','打打分','打打分',0,'上善若水',1521020743,NULL,1521172714,'虚怀若谷',1518532041,1);

/*Table structure for table `bms_website` */

DROP TABLE IF EXISTS `bms_website`;

CREATE TABLE `bms_website` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '站点Id，自增字段',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `description` varchar(200) NOT NULL COMMENT '站点描述',
  `bu` char(10) DEFAULT NULL COMMENT '站点所属bu',
  `domain` char(100) DEFAULT NULL COMMENT '站点访问域名',
  `cdn_domain` char(100) DEFAULT NULL COMMENT '站点静态资源访问域名',
  `create_author` varchar(20) DEFAULT NULL COMMENT '站点创建者',
  `create_time` int(11) DEFAULT NULL COMMENT '站点创建时间',
  `update_author` varchar(20) DEFAULT NULL COMMENT '站点更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '站点更新时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `bms_website` */

insert  into `bms_website`(`id`,`name`,`description`,`bu`,`domain`,`cdn_domain`,`create_author`,`create_time`,`update_author`,`update_time`,`user_id`) values (1,'黑豹个人站','提供信息分享平台','heibao','www.heibao.com','static.heibao.com','黑豹',1518532041,'黑豹',1518532041,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

