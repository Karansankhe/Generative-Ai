const { PrismaClient } =require('@prisma/client');
const prisma = new PrismaClient()

const AddSentiment=async(req,res)=>{
    try {
        const {id}=req.params;
        const {sentiment,date}=req.body;
        const data=await prisma.sentiment.create({
            data:{
                sentiment,
                date:new Date(date),
                userId:id
            }
        })
        return res.status(200).json({success:true,message:"Added successfully"})
    } catch (error) {
        console.log(error);
        return res.status(500).json({success:false,message:"Internal Server Error"});    
    }
}

module.exports=AddSentiment