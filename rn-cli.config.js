'use strict'
const path = require('path')

module.exports = {
  extraNodeModules: {
    'react-native-safe-area-plus': __dirname
  },
  getProjectRoots: function () {
    return [path.resolve(__dirname, 'samples/SafeAreaSample'), path.resolve(__dirname, '.')]
  }
}