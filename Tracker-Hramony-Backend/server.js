const express=require('express')
const app=express()
const userrouter = require('./routes/user.route')
const foodrouter=require('./routes/food.route')
const sentimentrouter=require('./routes/sentiment.route')
const diaryrouter=require('./routes/diary.route')
require('dotenv').config()
const PORT=process.env.PORT
var cors=require('cors')

app.use(cors())
app.use(express.json())
app.use('/user',userrouter)
app.use('',foodrouter)
app.use('/sentiment',sentimentrouter)
app.use('/diary',diaryrouter)

app.listen(PORT,()=>{
    console.log(`Server started at PORT:${PORT}🚀`);
})