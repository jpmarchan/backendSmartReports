const  { client } = require ('../conection');


const asingPatientMedic = async (req, res) =>{
    const {idpatient,idmedic} = req.body
    await client.query('UPDATE  users SET fkidmedic = $1 WHERE id = $2 AND rol = 1', [idmedic, idpatient])
    res.json({
        status: true,
        message:'medico asignado'
    })
}


const getKeywords = async (req, res) => {
    const response = await client.query('SELECT id, keyword, meanings, fountain FROM keyboars_and_meanings')
    res.status(200).json(response.rows)

}

const getMetrics = async (req, res) => {
    const responses = await client.query('SELECT m.id, m.count ,m.fkidreport, m.fkidkeyboars, m.fkidhospital, m.idsreports, h.name, k.keyword FROM metrics AS m INNER JOIN hospital AS h ON h.id = m.fkidhospital INNER JOIN keyboars_and_meanings AS k ON k.id = m.fkidkeyboars')

    res.status(200).json(responses.rows)


}


const keywordCreate = async (req, res) => {
    const {keyword, meanings , fountain} = req.body
    await client.query('INSERT INTO keyboars_and_meanings (keyword, meanings, fountain) VALUES ($1, $2, $3) RETURNING id', [keyword, meanings, fountain])
    res.json({
        responseMessage:'ya esta manito gaa 7u7',
        reponseCode: true
    })
}


module.exports = {
    asingPatientMedic,
    getKeywords,
    keywordCreate,
    getMetrics
}