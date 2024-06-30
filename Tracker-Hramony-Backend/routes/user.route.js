const express=require('express')
const UserSignup = require('../controller/User/userSignup.controller')
const UserLogin = require('../controller/User/userLogin.controller')
const router=express.Router()

router.post('/login',UserLogin)
router.post('/signup',UserSignup)

module.exports=router