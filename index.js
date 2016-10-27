require('babel-register');

if (process.env.NEW_RELIC_APP_NAME && process.env.NEW_RELIC_LICENSE_KEY) {
  require('newrelic');
}

global.Config = {
  LimiterOptions: {
    redis: {
      host: process.env.REDIS_HOST || '127.0.0.1',
      port: 6379,
      options: {}
    },
    namespace: 'limiter',
    global: {
      limit: 300,
      duration: 60
    }
  }
};

const source = require('./src/');

source();
