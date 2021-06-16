const { client } = require('../conection');

const getMedics = async (req, res) => {
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status FROM users WHERE rol = 2')
    res.status(200).json(response.rows)
    console.log(response.rows)
}

const getMedicById = async (req, res) => {
    const id = req.params.id
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status FROM users WHERE id = $1 AND rol = 2', [id])
    res.status(200).json(response.rows)

}

const getPatientsByIdMedic = async (req, res) => {
    const id = req.params.id
    const response = await client.query('SELECT id, name, lastname, dni, email, sex, age, especialidad, status  FROM users WHERE fkidmedic = $1 AND rol = 1', [id])
    res.status(200).json(response.rows)

}

const searchPatientsByDni = async (req, res) => {
    const { dni } = req.body

    const response = await client.query(`SELECT id, name, lastname, dni, email, sex, age, status  FROM users WHERE dni = $1 AND rol = 1`,[dni] )
    if(response.rows.length > 0){
        let data = {
            id: response.rows[0].id,
            name: response.rows[0].name,
            lastname: response.rows[0].lastname,
            dni: response.rows[0].dni,
            email: response.rows[0].email,
            sex: response.rows[0].sex,
            age: response.rows[0].age,
            status: response.rows[0].status,
        }
    
        res.status(200).json(data)
    }else{
        res.status(200).json(false) 
    }

}

const updateUserMedic = async (req, res) => {
    const id = req.params.id
    const { name, lastname, email, password, rol, status, dni, sex, age, especialidad } = req.body
    await client.query('UPDATE  users SET name = $1, email = $2, lastname = $3, dni = $4, sex = $5, age = $6, especialidad= $7 WHERE id = $8 AND rol = 2', [name,
        email,
        lastname,
        dni,
        sex,
        age,
        especialidad,
        id])
    res.json({
        message: 'medico actualizado '
    })
}


module.exports = {
    getMedics,
    getMedicById,
    getPatientsByIdMedic,
    updateUserMedic,
    searchPatientsByDni
}