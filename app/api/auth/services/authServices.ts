'use server'
import { Users } from '@/types/dbTypes.js';
import prisma from '@/lib/prisma';
import { LoginData,PayloadSession } from '@/types/authTypes.js';
import {SignJWT, jwtVerify} from 'jose'
import bcrypt from 'bcrypt'
import { cookies } from 'next/headers.js';

const secretKey=process.env.SESSION_SECRET;
const encodedKey=new TextEncoder().encode(secretKey);

const encrypt=async(payload:PayloadSession)=>{
    return new SignJWT(payload).
    setProtectedHeader({alg:'HS256'})
    .setIssuedAt()
    .setExpirationTime('7d')
    .sign(encodedKey)
}

const createCookie =async (session: string) => {
    const cookieStore =await cookies();
    cookieStore.set({
        name: 'session',
        value: session,
        httpOnly: true,
        secure: true,
        path: '/',
        sameSite: 'none',
    });
};

export const decrypt=async(session:string | undefined='')=>{
    try {
        const {payload}=await jwtVerify(session,encodedKey, {
            algorithms:['HS256'],
        })

        return payload
    } catch (error) {
        console.error(error);
    }
}


export async function RegisterUser(data:Users){
    const {username,email,password,age,rolId}=data;

    try{
        const hashedPassword=await bcrypt.hash(password,10);
        const registerUser=await prisma.users.create({
            data:{
                username:username,
                mail:email,
                password:hashedPassword,
                age:age,
                rolId:rolId
            }
        })

        if(!registerUser){
            return new Response(JSON.stringify({message:'correo no encontrado'}), {status:404})
        }

        return Response.json(registerUser);
    }catch(err){
        console.error(err);
    }
}

export async function login(data:LoginData){
    const {email,password}=data
    try {

        const checkUser=await prisma.users.findUnique({
            where:{
                mail:email,
            },
            include:{
                rol:true
            }
        })

        if(!checkUser){
            return new Response(JSON.stringify({message:'usuario no encontrado'}),{status:404})
        }

        const checkPasword=await bcrypt.compare(password,checkUser.password);


        if(!checkPasword){
            return new Response(JSON.stringify({message:"credenciales incorrectas"}),{status:404})
        }

        const payload={
            id:checkUser.id,
            email:checkUser.mail,
            userId:checkUser.id,
            rol:checkUser.rol.rol_description
        }

        const session=await encrypt(payload);
        await createCookie(session);

        return new Response(JSON.stringify({message:'login exitoso'}),{status:200});

    } catch (error) {
        console.error(error)
    }
}

export async function logOut(){
    try {
        const cookieStore=cookies();
        (await cookieStore).delete('sesion');
        return new Response(JSON.stringify("log out succesfully"),{status:200});
    } catch (error) {
        console.error(error);
    }
}

export async function GetSessionData(){
    try {
        const cookieStore=cookies()

        if(!(await cookieStore).has('sesion')){
            return new  Response(JSON.stringify({message: 'sesion no activa o expirada'}),{status:404})
        }

        const cookieData=(await cookieStore).get('sesion');
        const decodeData=await decrypt(cookieData?.value);
        return new Response(JSON.stringify(decodeData))
    } catch (error) {
        console.error(error);
    }
}