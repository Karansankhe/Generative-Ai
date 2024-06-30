const express=require('express')
const getDiary = require('../controller/Diary/getDiary.controller');
const addDiary = require('../controller/Diary/addDiary.controller');
const router=express.Router()

router.get('/:id',getDiary);
router.post('/:id',addDiary)

module.exports=router