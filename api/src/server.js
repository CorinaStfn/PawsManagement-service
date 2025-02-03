require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');

const app = express();
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});


app.listen(3000, () => {
  console.log('Server running on port 3000');
});
