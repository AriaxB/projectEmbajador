'use client'

import { usePathname } from "next/navigation";
import NavBar from "./navBar";

export default function ValidateNavbar(){
    const pathname:string=usePathname();
    const showNavBar:boolean=pathname=='/registro' || pathname=='/login' ? false : true;

    if(!showNavBar){
        return null;
    }else{
        return <NavBar />
    }
}