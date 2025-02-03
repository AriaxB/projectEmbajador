import { NextRequest,NextResponse } from "next/server.js";
import { login } from "../services/authServices";
import { ResponseController } from "@/types/responseType.js";

export async function POST(request:NextRequest){   
    try {
        const body=await request.json();
        await login(body);
        const response:ResponseController={
            message:"login suceesfully",
            status:200,
            state:true
        }

        return NextResponse.json(response);
    } catch (error) {
        console.error(error);
    }
}