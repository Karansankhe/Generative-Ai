const express=require('express')
const GetSentiment = require('../controller/Sentiment/getSentiment.controller')
const AddSentiment = require('../controller/Sentiment/addSentiment.controller')
const router=express.Router()

router.get('/:id',GetSentiment)
router.post('/:id',AddSentiment)

module.exports=router