import { NextRequest,NextResponse } from "next/server.js";
import { RegisterUser } from "../services/authServices";

export async function POST(request:NextRequest){
    const body=await request.json();
    try {
        const registerUser=await RegisterUser(body);
        const response={
            message:"register was successfully",
            status:200,
            state:true
        }

        return NextResponse.json(response,registerUser);
    } catch (error) {
        console.error(error);
    }
}