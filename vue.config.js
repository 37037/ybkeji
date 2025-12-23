const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    proxy: {
      '/api': {
        target: 'http://139.224.211.95:6000',
        changeOrigin: true,
        secure: false,
        // pathRewrite: { '^/api': '' }
      }
    }
  }
})
