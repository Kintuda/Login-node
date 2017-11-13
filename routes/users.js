var express = require('express');
var router = express.Router();
const passport = require('passport');
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
router.get('/login',(req,res,next)=>{
  res.render('login')
});
router.post('/login',passport.authenticate('local',{
  successRedirect:'/users/profile',
  failureRedirect:'/users/login'
}));

router.get('/profile',authenticationMiddleware(),(req,res,next)=>{
  res.render('perfil',{titulo:'Tela do usuário'});
})
router.get('/register', (req, res, next)=> {
  console.log(req.user);
  console.log(req.isAuthenticated());
  res.render('register');

});
router.post('/register',(req,res,next)=> {
  req.checkBody('usr','Username não pode ser nulo').notEmpty();
  req.checkBody('name','Nome não pode ser nulo').notEmpty();
  req.checkBody('email','Email não é válido').isEmail();
  req.checkBody('senha','Digite uma senha válida').notEmpty();
  req.checkBody('senha', 'Senha deve conter entre 8 e 50 caracteres').len(8, 50);
  req.checkBody('senha2','Digite uma senha válida').notEmpty();
  req.checkBody('senha2','As senhas são diferentes').equals(req.body.senha);
  const errors = req.validationErrors();
  if (errors) {
    console.log(`errors: ${JSON.stringify(errors)}`);
     return res.render('register',{errors:errors,teste:'Erro no cadastro'});
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
    bcrypt.hash(user.senha, saltRounds, (err, hash)=> {
      //Criar objeto com o comando SQL e valores
      var teste= {
        text: 'INSERT INTO cadastro(cad_email,cad_username,cad_fone,cad_senha,cad_nome,local_id) VALUES($1, $2, $3,$4,$5,$6) RETURNING cad_id',
        values: [user.email,user.usr,user.cel,hash,user.name,local]
      }
      //Insert no banco de dados
      pool.query(teste, (err, result) => {
          if (err)console.log(err.stack);
          const user_id = result.rows[0].cad_id;
          console.log(user_id);
           req.login(user_id,(err)=>{
             res.redirect('/users/register')
             // res.render('register',{teste:'Cadastro completo'});//Erro de variavel igual checar amanhã
             //Várias variáveis com mesmo nome res
          });

        //   pool.query('SELECT LAST_INSERT_ID() as user_id',function(err,res){
        //     const user_id = res[0];
        //     if(err)console.log(err.stack);
        //     console.log(res);
        //
        //   })
         });
      })
        // res.render('register',{teste:'Cadastro completo'})
  }
})
passport.serializeUser(function(user_id, done) {
   done(null, user_id);
 });
passport.deserializeUser(function(user_id, done) {
     done(null, user_id);
 });
function authenticationMiddleware () {
    return (req, res, next) => {
    	console.log(`req.session.passport.user: ${JSON.stringify(req.session.passport)}`);

        if (req.isAuthenticated()) return next();
        res.redirect('/users/profile')
    }
}
module.exports = router;
