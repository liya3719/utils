//日志相关配置
module.exports.loggerSetting = {
	dir: "D:\\logs",
	level: "DEBUG"
};

/**
 * 本地上传测试目录
 */
module.exports.imagesUrl = '本地上传测试目录';


//数据库相关配置
module.exports.dbConfig = {
    host: "本地数据库host",
    user: "用户名",
    password: "密码",
    database: "数据库名称",
    connectionLimit: 10,
    port: "端口号",
    waitForConnections: false,
    multipleStatements: true
};