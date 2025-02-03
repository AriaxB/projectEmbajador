import { NextRequest,NextResponse } from "next/server";
import { decrypt } from "./api/auth/services/authServices";
import prisma from "@/lib/prisma";

export  async function middleware(request:NextRequest) {
    const token = request.cookies.get("session");

    if (request.nextUrl.pathname.includes("/api/user") || request.nextUrl.pathname.includes("/api/admin")) {
        if (!token) {
            return NextResponse.json({ error: "user not authorized" }, { status: 401 });
        }

        try {
            console.log("middleware se empieza a ejecutar");
            const sessionData = await decrypt(token.value);

            if (!sessionData?.id || typeof sessionData.id !== "string") {
                return NextResponse.json({ error: "Invalid session" }, { status: 401 });
            }

            const userLogged = await prisma.users.findUnique({
                where: { id: sessionData.id },
            });

            if (!userLogged) {
                return NextResponse.json({ error: "user not found" }, { status: 404 });
            }

            console.log("middleware ejecutado");

            const response = NextResponse.next();
            response.headers.set("userId", userLogged.id);
            return response;

        } catch (error) {
            console.error(error);
            return NextResponse.json({ error: "Invalid session" }, { status: 400 });
        }
    }

    return NextResponse.next();
}

export const config = {
    matcher: ['/api/user/:path*', '/api/admin/:path*'],
};
