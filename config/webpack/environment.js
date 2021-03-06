const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.config.merge({
  plugins: [
    // Ignore autogenerated files with trailing ~, please!
    new webpack.IgnorePlugin(/.*~$/)
  ]
})

module.exports = environment
