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
    const response = await client.query('SELECT name, lastname, dni, email, sex, age, especialidad, status FROM users WHERE id = $1 AND rol = 2', [id])
    res.status(200).json(response.rows)

}

module.exports = {
    getMedics,
    getMedicById,
    getPatientsByIdMedic
}