/**
 * 日志记录相关配置
 */
module.exports.loggerSetting = {
    dir: "/root/logs/upload_images_server",
    level: "INFO"
};

/**
 * 生产环境保存图片路径
 */
module.exports.imagesUrl = '/data/fe-static/images/';

module.exports.dbConfig = {
    host: "服务器ip",
    user: "用户名",
    password: "密码",
    database: "数据库名字",
    connectionLimit: 10,
    port: "端口",
    waitForConnections: false,
    multipleStatements: true
};