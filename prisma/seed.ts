import prisma from "@/lib/prisma.jsx"
const Main=async()=>{
        await prisma.roles.createMany({
            data:[
                {rol_description:'client'},
                {rol_description:'admin'},
            ]
        })
    
        await prisma.users.createMany({
            data:[
                {username:"user123",mail:"user123@gmail.com",age:20,password:"Pollito123#",rolId:1},
                {username:"admin123",mail:"admin123@gmail.com",age:20,password:"Pollito123#",rolId:2}
            ]
        })
    
        await prisma.stateMatches.createMany({
            data:[
                {state_description:'Programado'},
                {state_description:'En juego'},
                {state_description:'Entre Tiempo'},
                {state_description:'Finalizado'},
                {state_description:'Suspendido'},
            ]
        })
}

Main()
.catch((e)=>{
    console.error(e);
    process.exit(1);
})
.finally(async()=>{
    await prisma.$disconnect()
});