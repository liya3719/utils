const webpack = require("webpack");
const fs = require("fs");
const path = require("path");
const baseDir = process.cwd();
const srcDir = path.resolve(baseDir, 'src');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const CompressionPlugin = require("compression-webpack-plugin");
const pkg = require("./package.json");
const projectName = pkg.name;
const version = pkg.version;


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