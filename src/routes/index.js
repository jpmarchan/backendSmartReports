const {Router} = require('express')
const router = Router()

const { getUsers, createUser,
     getUsersById, updateUser, updateStatusUser, sign } = require('../controller/user.controller')
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

router.get('/users', [verifyToken, getUsers])
router.get('/users/:id', [verifyToken, getUsersById])
router.post('/users', [verifyToken, createUser])
router.put('/updateUser/:id', [verifyToken, updateUser])
router.put('/updateUserStatus/:id', [verifyToken, updateStatusUser])




module.exports = router

