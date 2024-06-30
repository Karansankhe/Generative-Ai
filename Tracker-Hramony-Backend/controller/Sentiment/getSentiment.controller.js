const { PrismaClient } =require('@prisma/client');
const prisma = new PrismaClient()

const GetSentiment=async(req,res)=>{
    try {
        const {id}=req.params;
        const data=await prisma.sentiment.findMany({
            where:{
                userId:id
            }
        })
        return res.status(200).json({success:true,message:"Fetched successfully",data})
    } catch (error) {
        return res.status(500).json({success:false,message:"Internal Server Error"});    
    }
}

module.exports=GetSentiment