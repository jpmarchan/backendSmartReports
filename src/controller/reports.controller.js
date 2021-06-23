const  { client } = require ('../conection');


const createReport = async (req, res) =>{
    const {timestamp, idmedic , idpatient, detail} = req.body
    var date = timestamp.slice(0, -3);
    const reponse = await client.query('INSERT INTO reports_original (fecha, fkidmedico, fkidpaciente, detail, status) VALUES ($1, $2, $3 ,$4, $5) RETURNING id ',
     [date, idmedic, idpatient, detail, true])
     const  id  = reponse.rows[0].id;

     if(id){
        const reportGenerate =`${detail} reporte generado test`

        const responseGenerate = await client.query('INSERT INTO reports_generate (detail, fkidrepororiginal, status) VALUES ($1, $2, $3) RETURNING id ',
        [reportGenerate, id, true])

        if(responseGenerate.rows[0].id){
            res.json({
                responseMessage:'Reporte registrado',
                reponseCode: true,
                idReporOriginal: id
            })
         }else{
            res.json({
                responseMessage:'Error de registro',
                reponseCode: false
            })
         }
     }else{
        res.json({
            responseMessage:'Error de registro',
            reponseCode: false
        })
     }


 
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

const getReportByPatientOne = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT r.id, r.fecha, r.fkidmedico, r.fkidpaciente, r.status, u.name AS namedoc, u.lastname AS lastnamedoc FROM reports_original AS r INNER JOIN users AS u ON u.id = r.fkidmedico WHERE fkidpaciente = $1 AND r.status = true ORDER BY r.id DESC LIMIT 1', [id])
   
        response.rows.map(function(obj){
        var rObj = {};
        const unixTime = obj.fecha;
        const date = new Date(unixTime*1000);
        obj.fecha = date.toLocaleDateString("es-ES")
        return rObj;
     });
     console.log(response.rows)
     let data =
     {
        id: response.rows[0].id,
        fecha: response.rows[0].fecha,
        fkidmedico: response.rows[0].fkidmedico,
        fkidpaciente: response.rows[0].fkidpaciente,
        detail: response.rows[0].detail,
        status: response.rows[0].status,
        namedoc: response.rows[0].namedoc,
        lastnamedoc: response.rows[0].lastnamedoc,

     }
   
    res.status(200).json(data)

}

const getReportById = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT r.id, r.fecha, r.fkidmedico, r.fkidpaciente, r.detail , r.status,  u.name AS namedoc, u.lastname AS lastnamedoc, rg.detail AS detailgenerate, rg.id AS idreportgenerate, rg.status AS statusgenerate FROM reports_original AS r INNER JOIN users AS u ON u.id = r.fkidmedico INNER JOIN reports_generate AS rg ON rg.fkidrepororiginal = r.id WHERE r.id = $1 ', [id])
        response.rows.map(function(obj){
        var rObj = {};
        const unixTime = obj.fecha;
        const date = new Date(unixTime*1000);
        obj.fecha = date.toLocaleDateString("es-ES")
        return rObj;
     });

    let data =
     {
        id: response.rows[0].id,
        fecha: response.rows[0].fecha,
        fkidmedico: response.rows[0].fkidmedico,
        fkidpaciente: response.rows[0].fkidpaciente,
        detail: response.rows[0].detail,
        status: response.rows[0].status,
        namedoc: response.rows[0].namedoc,
        lastnamedoc: response.rows[0].lastnamedoc,
        detailgenerate: response.rows[0].detailgenerate,
        idreportgenerate: response.rows[0].idreportgenerate,
        statusgenerate: response.rows[0].statusgenerate,
     }
    res.status(200).json(data)

}


const WatchByReport = async (req, res) =>{

    const id = req.params.id
    await client.query('UPDATE  reports_original SET status = false WHERE id = $1', [
        id])
    res.json({
        message:'visualizado',
        reponseCode: true
    })   

}

module.exports = {

    createReport,
    getReportByPatient,
    WatchByReport,
    getReportById,
    getReportByPatientOne

}