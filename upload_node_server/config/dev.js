//日志相关配置
module.exports.loggerSetting = {
	dir: "D:\\logs",
	level: "DEBUG"
};

/**
 * 本地上传测试目录
 */
module.exports.imagesUrl = 'E:\\fe-static\\images\/';


//数据库相关配置
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