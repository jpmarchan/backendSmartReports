const pg = require('pg')


const conString = "pg://postgres:123456@localhost:5432/smartreport";
const client = new pg.Client(conString);
const conectioncheck = client.connect();

module.exports = {
    client,
    conectioncheck
  }
  
  