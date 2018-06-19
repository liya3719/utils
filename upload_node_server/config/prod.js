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
module.exports.imagesUrl = '生产环境保存图片路径';

module.exports.dbConfig = {
    host: "测试机host",
    user: "root",
    password: "密码",
    database: "数据库名称",
    connectionLimit: 10,
    port: "端口号",
    waitForConnections: false,
    multipleStatements: true
};