import { NextResponse } from "next/server.js";
import { logOut } from "../services/authServices";
import { ResponseController } from "@/types/responseType.js";

export async function GET(){
    try {
        await logOut()
        const response:ResponseController={
            message:"log out successfull",
            status:200,
            state:true
        }
        return NextResponse.json(response);
    } catch (error) {
        console.error(error);
    }
}