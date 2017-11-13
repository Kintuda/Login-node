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
module.exports = {
  Pool,
  pool,
  dbConfig,
  query: (text, params = []) => {

  }
};
// async function get () {
//   var resp = await db.query('SELECT * FROM pessoa')
//   console.log(resp)
//   console.log(resp.rows)
// }
/* pool.query('select * from cadastro',function(err,res){
   console.log(err,res)
});
// }*/
// pool.query('select * from cadastro', (err, res) => {
//     if (err) {
//       console.log(err.stack);
//     } else {
//       console.log(res.rows[0].cad_email)
//     }
//   })
