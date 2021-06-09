const  { client } = require ('../conection');


const createReport = async (req, res) =>{
    const {timestamp, idmedic , idpatient, detail} = req.body
    await client.query('INSERT INTO reports_original (fecha, fkidmedico, fkidpaciente, detail, status) VALUES ($1, $2, $3 ,$4, $5)',
     [timestamp, idmedic, idpatient, detail, true])
    res.json({
        responseMessage:'Reporte registrado',
        reponseCode:'00'
    })
}

const getReportByPatient = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT r.id, r.fecha, r.fkidmedico, r.fkidpaciente, r.status, u.name AS namedoc, u.lastname AS lastnamedoc FROM reports_original AS r INNER JOIN users AS u ON u.id = r.fkidmedico WHERE fkidpaciente = $1', [id])
   
        response.rows.map(function(obj){
        var rObj = {};
        const unixTime = obj.fecha;
        const date = new Date(unixTime*1000);
        obj.fecha = date.toLocaleDateString("es-ES")
        console.log( obj.fecha);
        return rObj;
     });
   
    res.status(200).json(response.rows)

}

const getReportById = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT r.id, r.fecha, r.fkidmedico, r.fkidpaciente, r.detail , r.status, r.detail, u.name AS namedoc, u.lastname AS lastnamedoc, rg.detail AS detailgenerate, rg.id AS idreportgenerate, rg.status AS statusgenerate FROM reports_original AS r INNER JOIN users AS u ON u.id = r.fkidmedico INNER JOIN reports_generate AS rg ON rg.fkidrepororiginal = r.id WHERE r.id = $1 LIMIT 1', [id])
   
        response.rows.map(function(obj){
        var rObj = {};
        const unixTime = obj.fecha;
        const date = new Date(unixTime*1000);
        obj.fecha = date.toLocaleDateString("es-ES")
        console.log( obj.fecha);
        return rObj;
     });
   
    res.status(200).json(response.rows)

}
const WatchByReport = async (req, res) =>{

    const id = req.params.id
    await client.query('UPDATE  reports_original SET status = false WHERE id = $1', [
        id])
    res.json({
        message:'visualizado',
        reponseCode:'00'
    })   

}

module.exports = {

    createReport,
    getReportByPatient,
    WatchByReport,
    getReportById

}