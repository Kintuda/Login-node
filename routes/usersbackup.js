var express = require('express');
var router = express.Router();
const expressValidator = require('express-validator');
const bcrypt = require('bcryptjs');
const saltRounds = 10;
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



/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('register');
});
router.post('/',function(req,res,next) {
  req.checkBody('usr','Username não pode ser nulo').notEmpty();
  req.checkBody('name','Nome não pode ser nulo').notEmpty();
  req.checkBody('email','Email não é válido').isEmail();
  req.checkBody('senha','Digite uma senha válida').notEmpty();
  req.checkBody('senha', 'Senha deve conter entre 8 a 100 caracteres').len(8, 100);
  req.checkBody('senha2','Digite uma senha válida').notEmpty();
  req.checkBody('senha2','As senhas são diferentes').equals(req.body.senha);
  const errors = req.validationErrors();
  if (errors) {
    console.log(`errors: ${JSON.stringify(errors)}`);
    res.render('register',{errors:errors,teste:'Erro no cadastro'});
    console.log(errors[0].msg)
  }else {
    const name = req.body.name;
    const username = req.body.usr;
    const email = req.body.email;
    const telefone = req.body.telefone;
    const senha= req.body.senha;
    const senha2 = req.body.senha2;
    const db = require('../db.js')
    const local = 1
    const user = {
      name:name,
      usr:username,
      email:email,
      cel:telefone,
      senha:senha,
      local:1
    };
    bcrypt.hash(user.senha, saltRounds, function(err, hash) {
      var teste= {
        text: 'INSERT INTO cadastro(cad_email,cad_username,cad_fone,cad_senha,cad_nome,local_id) VALUES($1, $2, $3,$4,$5,$6)',
        values: [user.email,user.usr,user.cel,hash,user.name,local]
      }
      pool.query(teste, (err, res) => {
          if (err) {
            console.log(err.stack);
          } else {
            console.log(res.rows[0]);
          }
        });
      })
      res.render('register',{teste:'Cadastro completo'})
  }
})
module.exports = router;
