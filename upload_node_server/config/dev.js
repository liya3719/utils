//日志相关配置
module.exports.loggerSetting = {
	dir: "D:\\logs",
	level: "DEBUG"
};

/**
 * 本地上传测试目录
 */
module.exports.imagesUrl = '/Users/lee/PersonalData/upload_images';


//数据库相关配置
module.exports.dbConfig = {
    host: "localhost",
    user: "root",
    password: "qwe#1234",
    database: "upload",
    connectionLimit: 10,
    port: "3306",
    waitForConnections: false,
    multipleStatements: true
};