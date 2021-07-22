const {Router} = require('express')
const router = Router()

const { getUsers, createUser,
     getUsersById, updateUser, updateStatusUser, sign } = require('../controller/user.controller')

const { getMedics, getMedicById,
    getPatientsByIdMedic, updateUserMedic, searchPatientsByDni} = require('../controller/medic.controller')

const { asingPatientMedic, getKeywords, keywordCreate, getMetrics} = require('../controller/admin.controller')

const { createReport, getReportByPatient, WatchByReport, getReportById, getReportByPatientOne} = require('../controller/reports.controller')

const  { verifyToken } = require ('../middlewares/authJwt');


    
//inicio de sesion
router.post('/sign', sign)

// mantenimiento usuarios PACIENTES.
router.get('/users', [verifyToken, getUsers])
router.get('/users/:id', [verifyToken, getUsersById])
router.post('/users', [ createUser])
router.put('/updateUser/:id', [verifyToken, updateUser])
router.put('/updateUserStatus/:id', [verifyToken, updateStatusUser])

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




//Mantenimieto REPORTES.
router.post('/report', [verifyToken, createReport])
router.get('/getReportByPatientOne/:id', [verifyToken, getReportByPatientOne])
router.get('/reportByPatient/:id', [verifyToken, getReportByPatient])
router.get('/WatchByReport/:id', [verifyToken, WatchByReport])
router.get('/getReportById/:id', [verifyToken, getReportById])


module.exports = router

