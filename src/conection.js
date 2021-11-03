const pg = require('pg')


const conString = "pg://@localhost:5432/smartreports";
const client = new pg.Client(conString);
const conectioncheck = client.connect();

module.exports = {
    client,
    conectioncheck
  }
  
  