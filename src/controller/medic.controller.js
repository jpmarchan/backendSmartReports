const  { client } = require ('../conection');

const getMedics = async (req, res) =>{
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status FROM users WHERE rol = 2')
    res.status(200).json(response.rows)
    console.log(response.rows)
}

const getMedicById = async (req, res) =>{
    const id = req.params.id
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status FROM users WHERE id = $1 AND rol = 2', [id])
    res.status(200).json(response.rows)

}

const getPatientsByIdMedic = async (req, res) =>{
    const id = req.params.id
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status  FROM users WHERE fkidmedic = $1 AND rol = 1', [id])
    res.status(200).json(response.rows)

}

const updateUserMedic = async (req, res) =>{
    const id = req.params.id
    const {name, lastname, email, password, rol, status, dni, sex, age, especialidad} = req.body
    await client.query('UPDATE  users SET name = $1, email = $2, lastname = $3, dni = $4, sex = $5, age = $6, especialidad= $7 WHERE id = $8 AND rol = 2', [name,
        email,
        lastname,
        dni,
        sex,
        age,
        especialidad,
        id])
    res.json({
        message:'medico actualizado '
    })
}


module.exports = {
    getMedics,
    getMedicById,
    getPatientsByIdMedic,
    updateUserMedic
}