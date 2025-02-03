import { NextResponse } from "next/server";

export async function GET(){
        try {
            return NextResponse.json({greeting:'hellow world',status:200});
        } catch (error) {
            console.error(error);
            return NextResponse.json({error:'fialed to greeting user',status:500})
        }
}