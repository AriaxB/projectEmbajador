import Image from "next/image"
import Link from "next/link"

export default function NavBar(){
    return(
        <div className="w-auto h-auto">
            <div className="flex p-2 flex-row justify-around w-full h-auto max-w-full min-w-52 bg-white">
            <div className="flex justify-center self-center  w-auto h-full">
                <Image
                    src={'/logo.png'}
                    alt={"logo"}
                    width={200}
                    height={200}
                />
            </div>
            <nav className="my-auto">
                <ul className="flex flex-row space-x-4 justify-around font-sans text-2xl">
                    <li><Link href='/'>Inicio</Link></li>
                    <li><Link href='/blogs'>Blogs</Link></li>
                    <li><Link href='/equipo'>equipo</Link></li>
                    <li><Link href='/comunidad'>Comunidad</Link></li>
                    <li><Link href='/contacto'>Contacto</Link></li>
                </ul>
            </nav>
            <div className="flex space-x-3 justify-center self-center text-2xl">
                <Link className="hover:text-violet-500 hover:underline" href={'/login'}>Iniciar sesion</Link>
                <Link className='hover:text-violet-500 hover:underline' href={'/registro'}>Registrate</Link>
            </div>
            </div>
        </div>
    )
}