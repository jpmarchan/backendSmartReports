const {Router} = require('express')
const router = Router()

const { getUsers, createUser,
     getUsersById, updateUser, updateStatusUser, sign, deleteUsersById } = require('../controller/user.controller')

const { getMedics, getMedicById,
    getPatientsByIdMedic, updateUserMedic, searchPatientsByDni} = require('../controller/medic.controller')

const { asingPatientMedic, getKeywords, keywordCreate, getMetrics, getDietas, getDietaById} = require('../controller/admin.controller')

const { createReport, getReportByPatient, WatchByReport, getReportById, getReportByPatientOne, createReportAnemi, createRecetabypatient, getrecetabrreportid} = require('../controller/reports.controller')

const  { verifyToken } = require ('../middlewares/authJwt');


    
//inicio de sesion
router.post('/sign', sign)

// mantenimiento usuarios PACIENTES.
router.get('/users', [verifyToken, getUsers])
router.get('/users/:id', [verifyToken, getUsersById])
router.post('/users', [ createUser])
router.post('/updateUser', [verifyToken, updateUser])
router.put('/updateUserStatus/:id', [verifyToken, updateStatusUser])
router.delete('/deleteUser/:id', [ deleteUsersById])

// mantenimiento usuarios MEDICOS.

router.get('/getMedics', [verifyToken, getMedics])
router.get('/getMedicById/:id', [verifyToken, getMedicById])
router.get('/getPatientsByIdMedic/:id', [verifyToken, getPatientsByIdMedic])
router.put('/updateUserMedic/:id', [verifyToken, updateUserMedic])
router.post('/searchPatientsByDni', [verifyToken, searchPatientsByDni])

//acciones ADMINISTRADOR.

router.put('/asingPatientMedic', [verifyToken, asingPatientMedic])
router.get('/getKeywords', [verifyToken, getKeywords])
router.post('/keywordCreate', [verifyToken, keywordCreate])
router.get('/getMetrics', [verifyToken, getMetrics])

router.get('/getDietas', [verifyToken, getDietas])
router.get('/getDietaById/:id', [verifyToken, getDietaById])
router.get('/getDietaByIdreport/:id', [verifyToken, getrecetabrreportid])




//Mantenimieto REPORTES.
router.post('/report', [verifyToken, createReport])
router.post('/createreceta', [verifyToken, createRecetabypatient])

router.post('/reportAnemi', [verifyToken, createReportAnemi])

router.get('/getReportByPatientOne/:id', [verifyToken, getReportByPatientOne])
router.get('/reportByPatient/:id', [verifyToken, getReportByPatient])
router.get('/WatchByReport/:id', [verifyToken, WatchByReport])
router.get('/getReportById/:id', [verifyToken, getReportById])


module.exports = router

