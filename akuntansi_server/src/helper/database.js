import mysql from 'mysql2';
import dotenv from 'dotenv';
dotenv.config();

const { DB_HOST, DB_USER, DB_PASS, DB_DATABASE } = process.env;

const connection = mysql.createPool({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASS,
  database: DB_DATABASE
})

export default connection.promise();