var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');
const pg = require('pg');
const LocalStrategy = require('passport-local')
const db = require('./db.js')
//Autenticação
const session = require('express-session');
const passport = require('passport');
const pgSession = require('connect-pg-simple')(session);
const bcrypt = require('bcryptjs');
//rotas
var index = require('./routes/index');
var users = require('./routes/users');
app
var app = express();
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(expressValidator());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//Cookies sessão
const dbConfig = {
  host: 'localhost',
  database: 'agroweb',
  user: 'postgres',
  password: 'FCV',
  port: 5432,
  ssl: false
};
var pgPool = new pg.Pool(dbConfig);
app.use(session({
  store: new pgSession({
    pool : pgPool,
    tableName : 'session'
  }),
  secret: 'dbqiojbqdhd',
  resave: false,
  saveUninitialized: false,
   // cookie: { secure: true }
}));
app.use(passport.initialize());
app.use(passport.session());

app.use('/', index);
app.use('/users', users);

passport.use(new LocalStrategy(
  function(username, password, done) {
    console.log(username)
    console.log(password)
    pool.query('SELECT cad_senha FROM cadastro WHERE cad_username = $1',[username],(err,res)=>{
      if(err){done(err)};
      console.log(res.rows[0])
       if (res.rows[0] === undefined) {
         done(null,false)
       }
       console.log(res.rows[0])
        if(res.rows[0]!=undefined){const hash = res.rows[0].cad_senha;}
        bcrypt.compare(password,hash,(err,response)=>{
          if (response === true) {
             return done(null,{cad_id:43});
          }else{
            return done(null,false);
          }
        })

       return done(null,'jdaon')
    })
  }
));
//DB
const Pool = require('pg').Pool
const pool = new Pool(dbConfig)
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
