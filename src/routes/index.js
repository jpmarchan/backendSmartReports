const {Router} = require('express')
const router = Router()

const { getUsers, createUser,
     getUsersById, updateUser, updateStatusUser, sign } = require('../controller/user.controller')

const { getMedics, getMedicById,
    getPatientsByIdMedic, updateUserMedic } = require('../controller/medic.controller')
    const { asingPatientMedic} = require('../controller/admin.controller')

const  { verifyToken } = require ('../middlewares/authJwt');

    
//inicio de sesion
router.post('/sign', sign)

// mantenimiento usuarios PACIENTES.
router.get('/users', [verifyToken, getUsers])
router.get('/users/:id', [verifyToken, getUsersById])
router.post('/users', [verifyToken, createUser])
router.put('/updateUser/:id', [verifyToken, updateUser])
router.put('/updateUserStatus/:id', [verifyToken, updateStatusUser])

// mantenimiento usuarios MEDICOS.

router.get('/getMedics', [verifyToken, getMedics])
router.get('/getMedicById/:id', [verifyToken, getMedicById])
router.get('/getPatientsByIdMedic/:id', [verifyToken, getPatientsByIdMedic])
router.put('/updateUserMedic/:id', [verifyToken, updateUserMedic])

//acciones ADMINISTRADOR.

router.put('/asingPatientMedic', [verifyToken, asingPatientMedic])







module.exports = router

