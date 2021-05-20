const {Router} = require('express')
const router = Router()

const { getUsers, createUser,
     getUsersById, updateUser, updateStatusUser, sign } = require('../controller/user.controller')

    
//inicio de sesion
router.post('/sign', sign)

// mantenimiento usuarios.
router.get('/users', getUsers)
router.get('/users/:id', getUsersById)
router.post('/users', createUser)
router.put('/updateUser/:id', updateUser)
router.put('/updateUserStatus/:id', updateStatusUser)




module.exports = router

