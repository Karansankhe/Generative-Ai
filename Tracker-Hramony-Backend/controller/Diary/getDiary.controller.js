const { PrismaClient } =require('@prisma/client');
const prisma = new PrismaClient()

const getDiary=async(req,res)=>{
    try {
        const id=req.params.id;
        const data=await prisma.diary.findMany({
            where:{
                userId:id
            }
        })
        return res.status(200).json({success:true,data})
    } catch (error) {
        return res.status(500).json({success:false,message:"Internal Server Error"});             
    }
}

module.exports=getDiary