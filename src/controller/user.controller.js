const jwt = require('jsonwebtoken');
const config = require('../config')
const  { client } = require ('../conection');

// mantenimiento usuarios PACIENTES.

const getUsers = async (req, res) =>{
    const response = await client.query('SELECT id, name, lastname, dni, email, sex, age, status, fkidmedic  FROM users WHERE rol = 1')
    res.status(200).json(response.rows)
    console.log(response.rows)
}

const getUsersById = async (req, res) =>{
    const id = req.params.id

    const response = await client.query('SELECT id, name, lastname, dni, email, sex, age, status, fkidmedic FROM users WHERE id = $1 AND rol = 1', [id])
    res.status(200).json(response.rows)

}

const createUser = async (req, res) =>{
    const {name, lastname, email, password, rol, status, dni, sex, age} = req.body

    const response = await client.query('SELECT id, email status FROM users WHERE email = $1  AND rol = 1',[email])
    if(response.rows.length > 0){
        res.status(200).json({message:'email ya existe', status: false})
    }else{
        await client.query('INSERT INTO users (name, lastname, email, password, rol, status, dni, sex, age) VALUES ($1, $2, $3 ,$4, $5, $6, $7, $8, $9)', [name, lastname, email, password, rol, status, dni, sex, age])
        res.json({
            message:'usuario creado ',
            status: true
        })
    }

}

const updateUser = async (req, res) =>{
    const {sex, age, departament,id} = req.body
    await client.query('UPDATE  users SET sex = $1, age = $2, departament = $3  WHERE id = $4 AND rol = 1', [
        sex,
        age,
        departament,
        id,
        ])
    res.json({
        message:'usuario actualizado',
        status:true
    })
}

const updateStatusUser = async (req, res) =>{
    const id = req.params.id
    const {status} = req.body
    await client.query('UPDATE  users SET status = $1 WHERE id = $2 AND rol = 1', [
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
    if(response.rows.length > 0){
        const rol = response.rows[0].rol
        const token = jwt.sign({id:response.rows[0].id},
        config.SECRET, {expiresIn: 86400})
        res.json({rol, status:response.rows[0].status,  response: true, token,
             userName: response.rows[0].name, userId: response.rows[0].id, age: response.rows[0].age, departament: response.rows[0].departament})
    }else{
        res.json({response: false})
    }

}


module.exports = {
    getUsers,
    createUser,
    getUsersById,
    updateUser,
    updateStatusUser,
    sign
}