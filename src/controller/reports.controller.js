const  { client } = require ('../conection');


const createReport = async (req, res) =>{
    console.log('reporttt');
    const {timestamp, idmedic , idpatient, detail} = req.body
    var ultimo = detail.replace(/,/g, "")
    var separado = ultimo.split(' ');

    var detailgenerate = detail
    var date = timestamp.slice(0, -3);
    const user = await client.query('SELECT fkidhospital FROM users WHERE id = $1 AND rol = 2', [idmedic])
    let idhospital = 0;
    if(user.rows[0]){
        idhospital = user.rows[0].fkidhospital
    }
    const report = await client.query('INSERT INTO reports_original (fecha, fkidmedico, fkidpaciente, detail, status) VALUES ($1, $2, $3 ,$4, $5) RETURNING id ',
     [date, idmedic, idpatient, detail, true])
     const  id  = report.rows[0].id;

    for (const driver of separado) {
        const response = await client.query('SELECT id, keyword, meanings FROM keyboars_and_meanings WHERE keyword = $1', [driver])

        if(response.rows[0]){
            const metrics = await client.query('SELECT id, count ,fkidreport, fkidkeyboars, fkidhospital, idsreports FROM metrics WHERE fkidkeyboars = $1 AND fkidhospital = $2', [response.rows[0].id, idhospital])
            if(metrics.rows[0]){
                const reportsids = metrics.rows[0].idsreports.id
                reportsids.push(id)
                    const newids = {id:reportsids}
                await client.query('UPDATE  metrics SET count = $1, idsreports = $2 WHERE id = $3', [metrics.rows[0].count + 1, newids, metrics.rows[0].id]);
            }else{
                console.log("insert")
                const idreports = {id:[id]}
                await client.query('INSERT INTO metrics (count ,fkidreport, fkidkeyboars, fkidhospital, idsreports) VALUES ($1, $2, $3, $4, $5) RETURNING id ', [1, id, response.rows[0].id, idhospital, idreports])
            }

            detailgenerate = detailgenerate.replace(driver, `${driver} "${response.rows[0].meanings}"`);

        }
    }


     if(id){
        const reportGenerate = detailgenerate

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
const createReportAnemi = async (req, res) =>{
    const {timestamp, idmedic , idpatient, detail} = req.body
    var ultimo = detail.replace(/,/g, "")
    var separado = ultimo.split(' ');

    var detailgenerate = detail
    var date = timestamp.slice(0, -3);
    const user = await client.query('SELECT fkidhospital FROM users WHERE id = $1 AND rol = 2', [idmedic])
    let idhospital = 0;
    if(user.rows[0]){
        idhospital = user.rows[0].fkidhospital
    }
    const report = await client.query('INSERT INTO reports_original (fecha, fkidmedico, fkidpaciente, detail, status) VALUES ($1, $2, $3 ,$4, $5) RETURNING id ',
     [date, idmedic, idpatient, detail, true])
     const  id  = report.rows[0].id;
     res.json({
        responseMessage:'Reporte registrado',
        reponseCode: true,
        idReporOriginal: id
    })

 
}

const createRecetabypatient = async (req, res) =>{
    const {fecha, iddieta , idreport } = req.body


    const report = await client.query('INSERT INTO dietasforpatient (fechafinal, fkiddieta, fkireporte) VALUES ($1, $2, $3 ) RETURNING id ',
     [fecha, iddieta , idreport])
     const  id  = report.rows[0].id;
     res.json({
        responseMessage:'registrado',
        reponseCode: true,
        idcita: id
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

const getrecetabrreportid = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT * FROM dietasforpatient WHERE fkireporte = $1', [id])
    if(response.rows.length > 0){
        const response2 = await client.query('SELECT * FROM dietas WHERE id = $1', [response.rows[0].fkiddieta])

        let data =
        {
           id: response2.rows[0].id,
           name: response2.rows[0].name,
           description: response2.rows[0].description,
           almuerzo: response2.rows[0].almuerzo,
           desayuno: response2.rows[0].desayuno,
           cena: response2.rows[0].cena,
           ingredientesdesayuno: response2.rows[0].ingredientesdesayuno,
           ingredientesalmuerzo: response2.rows[0].ingredientesalmuerzo,
           ingredientescena: response2.rows[0].ingredientescena,
    
        }
       res.status(200).json(data)

    }else{
        res.status(200).json(response.rows)
    }
   

}

const getReportByPatientOne = async (req, res) =>{

    const id = req.params.id
    const response = await client.query('SELECT r.id, r.fecha, r.fkidmedico, r.fkidpaciente, r.status, u.name AS namedoc, u.lastname AS lastnamedoc FROM reports_original AS r INNER JOIN users AS u ON u.id = r.fkidmedico WHERE fkidpaciente = $1 AND r.status = true ORDER BY r.id DESC LIMIT 1', [id])
    console.log(response.rows)

        response.rows.map(function(obj){
        var rObj = {};
        const unixTime = obj.fecha;
        const date = new Date(unixTime*1000);
        obj.fecha = date.toLocaleDateString("es-ES")
        return rObj;
     });
     if(response.rows.length){
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
    getReportByPatientOne,
    createReportAnemi,
    createRecetabypatient,
    getrecetabrreportid

}