const webpack = require("webpack");
const path = require("path");
const baseDir = process.cwd();
const pkg = require("./package.json");


module.exports = function () {
  var extendConf = {
    plugins: [
      new webpack.ProvidePlugin({
        axios: "axios",
        "window.axios": "axios"
      })
    ],
    resolve: {
      alias: {
        "axios": path.resolve(baseDir, 'node_modules/axios/dist/axios.min.js'),
        'vue$': path.resolve(baseDir, 'node_modules/vue/dist/vue.min.js')
      }
    },
    module: {
      rules: [{
        test: /(\.ts|\.tsx)$/,
        exclude: /(node_modules|bower_components)/,
        use: [{
          loader: 'ts-loader',
          options: {
            appendTsSuffixTo: [/\.vue$/]
          }
        }]

      }]
    }
  };
  return extendConf;
};