const db = require('./db.js');
const Pool = require('pg').Pool
const dbConfig = {
  host: 'localhost',
  database: 'agroweb',
  user: 'postgres',
  password: 'FCV',
  port: 5432,
  ssl: false
}
const pool = new Pool(dbConfig)
// db.query('SELECT * from local', (err, res) => {
//   if (err) {
//     console.log(err.stack)
//   } else {
//     console.log(res.rows[0])
//   }
// })
// async function get () {
//   var resp = await db.query('SELECT * FROM cadastro')
//   console.log(resp.rows)
// }
pool.query('select * from local', (err, res) => {
    if (err) {
      console.log(err.stack);
    } else {
      console.log(res.rows[0])
    }
  })
