const { PrismaClient } =require('@prisma/client');
const { encryptPassword } = require('../../utils/bcrypt.util');
const prisma = new PrismaClient()

const UserSignup=async(req,res)=>{
    try {
        const {email,name,password}=req.body;
        const exist=await prisma.user.findFirst({
            where:{
                email
            }
        });
        if(exist){
            return res.status(404).json({success:true,message:"User already exist"})
        }else{
            const data=await prisma.user.create({
                data:{
                    email,
                    name,
                    password:await encryptPassword(password)
                }
            })
            return res.status(200).json({success:true,message:"User created successfully",id:data.id})
        }
    } catch (error) {
        return res.status(500).json({success:false,message:"Internal Server Error"});     
    }
}

module.exports=UserSignup