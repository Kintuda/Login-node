const faker = require('faker');
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
  pool,
  query: (text, params = []) => {
  }
};
function pessoa(){
  let i = 0;
  while(i<10){
    var user = {
      name:faker.name.findName(),
      email:faker.internet.email(),
      address:faker.address.streetAddress(),
      userName:faker.internet.userName(),
      senha:faker.internet.password(),
      uf:faker.address.stateAbbr(),
      fone:faker.phone.phoneNumber(),
      cep:faker.address.zipCode(),
      local: 1
    }
      console.log(user)
      var insert= {
        text: 'INSERT INTO cadastro(cad_email,cad_username,cad_fone,cad_senha,cad_nome,local_id) VALUES($1, $2, $3,$4,$5,$6)',
        values: [user.email,user.userName,user.fone,user.senha,user.name,user.local],
      }
      pool.query(insert, (err, res) => {
          if (err) {
            console.log(err.stack);
          } else {
            console.log(res.rows[0])
          }
        })
        i++
    }
  }
function cidade(){
  let i = 5
  while(i<10){
  var cidade ={
    cidade: faker.address.city(),
    uf:faker.address.zipCode(),
    pais:faker.address.country()
  }
  var insert= {
    text: 'INSERT INTO local(local_cidade,local_uf,local_pais) VALUES($1, $2, $3)',
    values: [cidade.cidade,cidade.uf,cidade.pais],
  }
  pool.query(insert, (err, res) => {
      if (err) {
        console.log(err.stack);
      } else {
        console.log(res.rows[0])
      }
    })
    i++
  }
}
function produto(){
  let i = 0;
  while (i<10) {
    var produto = {
      nome:faker.commerce.product(),
      preco:faker.commerce.price(),
      quantidade:faker.random.number(),
      data:faker.date.past(),
      categoria:1,
      for:2
    }
    var insert= {
      text: 'INSERT INTO produto(prd_nome,prd_preco,prd_qt,prd_data,cat_id,for_id) VALUES($1, $2, $3,$4,$5,$6)',
      values: [produto.nome,produto.preco,produto.quantidade,produto.data,produto.categoria,produto.for],
    }
    pool.query(insert, (err, res) => {
        if (err) {
          console.log(err.stack);
        } else {
          console.log(res.rows[0])
        }
      })
      i++
  }
}
function fornecedor(){
  let i = 0;
  while (i<10) {
    var fornecedor={
      nome:faker.company.companyName(),
      fone:faker.phone.phoneNumber(),
      endereco:faker.address.streetName(),
      logo:faker.image.imageUrl(),
      pagamento:faker.finance.transactionType(),
      email:faker.internet.email(),
      url:faker.internet.url(),
      local:1
    }
    var insert= {
      text: 'INSERT INTO fornecedor(for_nome,for_telefone,for_endereco,for_logo,for_pagamento,for_email,for_url,local_id) VALUES($1, $2, $3,$4,$5,$6,$7,$8)',
      values: [fornecedor.nome,fornecedor.fone,fornecedor.endereco,fornecedor.logo,fornecedor.pagamento,fornecedor.email,fornecedor.url,fornecedor.local],
    }
    pool.query(insert, (err, res) => {
        if (err) {
          console.log(err.stack);
        } else {
          console.log(res.rows[0])
        }
      })
      i++
  }
}
produto()
