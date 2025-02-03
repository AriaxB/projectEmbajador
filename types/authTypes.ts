export type LoginData={
    email:`${string}@${string}.com`,
    password:string
}

export type PayloadSession={
    id:string,
    email:`${string}@${string}.com` | string,
    userId:string,
    rol:string
}