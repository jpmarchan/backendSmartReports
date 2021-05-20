const pg = require('pg')

var conString = "pg://postgres:123456@localhost:5432/smartreports";
var client = new pg.Client(conString);
client.connect();

const getUsers = async (req, res) =>{
    const response = await client.query('SELECT * FROM users')
    res.status(200).json(response.rows)
    console.log(response.rows)
}

const getUsersById = async (req, res) =>{
    const id = req.params.id

    const response = await client.query('SELECT * FROM users WHERE id = $1', [id])
    res.status(200).json(response.rows)

}

const createUser = async (req, res) =>{
    const {name, email, password, rol, status} = req.body
    await client.query('INSERT INTO users (name, email, password, rol, status) VALUES ($1, $2, $3 ,$4, $5)', [name, email, password, rol, status])
    res.json({
        message:'usuario creado ',
        name: name,
        email: email
    })
}

const updateUser = async (req, res) =>{
    const id = req.params.id
    const {name, email, password, rol, status} = req.body
    await client.query('UPDATE  users SET name = $1, email = $2 WHERE id = $3', [name,
        email,
        id])
    res.json({
        message:'usuario actualizado '
    })
}

const updateStatusUser = async (req, res) =>{
    const id = req.params.id
    const {status} = req.body
    await client.query('UPDATE  users SET status = $1 WHERE id = $2', [
        status,
        id])
    res.json({
        message:'status actualizado '
    })
}

const sign = async (req, res) =>{
    const {email, password} = req.body
    const response = await client.query('SELECT * FROM users WHERE email = $1 AND password = $2 ', [
        email,
        password])
    if(response.rows.length > 0)res.json({response: true})
    res.json({response: false})

}





module.exports = {
    getUsers,
    createUser,
    getUsersById,
    updateUser,
    updateStatusUser,
    sign
}