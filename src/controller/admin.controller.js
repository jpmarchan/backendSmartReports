const  { client } = require ('../conection');


const asingPatientMedic = async (req, res) =>{
    const {idpatient,idmedic} = req.body
    await client.query('UPDATE  users SET fkidmedic = $1 WHERE id = $2 AND rol = 1', [idmedic, idpatient])
    res.json({
        status: true,
        message:'medico asignado'
    })
}


module.exports = {
    asingPatientMedic
}