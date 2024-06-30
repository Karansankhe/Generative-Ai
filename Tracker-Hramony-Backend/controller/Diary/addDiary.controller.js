const { PrismaClient } =require('@prisma/client');
const prisma = new PrismaClient()

const addDiary=async(req,res)=>{
    try {
        const id=req.params.id;
        const {content}=req.body;
        const data=await prisma.diary.create({
            data:{
                userId:id,
                content
            }
        })
        return res.status(200).json({success:true,data})
    } catch (error) {
        return res.status(500).json({success:false,message:"Internal Server Error"});             
    }
}

module.exports=addDiary