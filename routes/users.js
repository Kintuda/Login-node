var express = require('express');
var router = express.Router();
var expressValidator = require('express-validator');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('register');
});
router.post('/',function(req,res,next) {
  const name = req.body.name;
  const username = req.body.usr;
  const email = req.body.email;
  const fone = req.body.fone;
  const senha= req.body.senha;
  const senha2 = req.body.senha2;
  req.checkBody('usr','Username não pode ser nulo').notEmpty();
  req.checkBody('name','Nome não pode ser nulo').notEmpty();
  req.checkBody('email','Email não é válido').isEmail();
  req.checkBody('senha','Digite uma senha válida').notEmpty();
  req.checkBody('senha2','Digite uma senha válida').notEmpty();
  req.checkBody('senha2','As senhas são diferentes').equals(senha);
  const errors = req.validationErrors();
  if (errors) {
    console.log(`errors: ${JSON.stringify(errors)}`);
    res.render('index')
  }
  const db = require('../db.js')
  const local = 1
  const user = {
    name:name,
    usr:username,
    email:email,
    cel:fone,
    senha:senha,
    local:1
  }

  var insert= {
    text: 'INSERT INTO cadastro(cad_email,cad_username,cad_fone,cad_senha,cad_nome,local_id) VALUES($1, $2, $3,$4,$5,$6)',
    values: [email,username,fone,senha,name,local],
  }
  db.query(insert, (err, res) => {
      if (err) {
        console.log(err.stack);
        res.render('index',{title:'error'})
      } else {
        console.log(res.rows[0])
        res.render('register',{teste:'certo'})
      }
    })



})
module.exports = router;
