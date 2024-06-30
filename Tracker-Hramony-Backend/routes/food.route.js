const express=require('express')
const getBreakfast = require('../controller/getFood/getBreakfast.controller')
const getLunch = require('../controller/getFood/getLunch.controller')
const getDinner = require('../controller/getFood/getDinner.controller')
const addBreakfast = require('../controller/AddFood/addbreakfast.controller')
const addLunch = require('../controller/AddFood/addLunch.controller')
const addDinner = require('../controller/AddFood/addDinner.controller')
const router=express.Router()

router.get('/breakfast/:id',getBreakfast)
router.get('/lunch/:id',getLunch)
router.get('/dinner/:id',getDinner)
router.post('/breakfast',addBreakfast)
router.post('/lunch',addLunch)
router.post('/dinner',addDinner)

module.exports=router