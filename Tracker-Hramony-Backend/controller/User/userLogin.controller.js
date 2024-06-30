const { PrismaClient } =require('@prisma/client');
const { comparePassword } = require('../../utils/bcrypt.util');
const prisma = new PrismaClient()

const UserLogin=async(req,res)=>{
    try {
        const {email,password}=req.body;
        const exist=await prisma.user.findFirst({
            where:{
                email
            }
        });
        if(!exist){
            return res.status(405).json({success:false,message:"User does not exist"});
        }else{
            if(await comparePassword(password,exist.password)==true){
                return res.status(200).json({success:true,message:"User authenticated successfully",id:exist.id}); 
            }else{
                return res.status(404).json({success:false,message:"Incorrect password"}); 
            }
        }
    } catch (error) {
        return res.status(500).json({success:false,message:"Internal Server Error"});             
    }
}

module.exports=UserLogin