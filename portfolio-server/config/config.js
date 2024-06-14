require('dotenv').config(); // Load environment variables from .env

const { Sequelize } = require('sequelize');

const env = process.env.NODE_ENV || 'development';

const config = {
  development: {
    dialect: 'postgres',
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    username: process.env.DB_USER || 'botirovs03',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'portfolio',
    logging: false,
    operatorsAliases: false
  },
  production: {
    dialect: 'postgres',
    host: process.env.DB_HOST_PROD || 'localhost',
    port: process.env.DB_PORT_PROD || 5432,
    username: process.env.DB_USER_PROD || 'your_prod_user',
    password: process.env.DB_PASSWORD_PROD || 'your_prod_password',
    database: process.env.DB_NAME_PROD || 'your_production_database',
    logging: false,
    operatorsAliases: false
  }
};

module.exports = config[env];
