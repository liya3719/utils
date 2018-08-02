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
    host: "172.16.16.32",
    user: "root",
    password: "nat-fe123",
    database: "upload",
    connectionLimit: 10,
    port: "3306",
    waitForConnections: false,
    multipleStatements: true
};