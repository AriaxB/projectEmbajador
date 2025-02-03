'use client'

import { Formik,Field } from "formik"
import Link from "next/link"

export default function PageLogin(){
    type loginInitialValues={
        email:string,
        password:string
    }

    const initialValues:loginInitialValues={
        email:'',
        password:''
    }
    return(
        <div >
            <div className="w-auto max-w-96 h-auto mx-auto my-20 flex flex-col justify-center bg-white p-5">
                <div className="self-start text-2xl text-darBlue font-bold">
                    <h1>Iniciar sesion</h1>
                </div>
                <Formik
                    initialValues={initialValues}
                    onSubmit={(values,actions)=>{
                        console.log(values, actions);
                        actions.setSubmitting(false);
                    }}
                >
                {()=>(
                <form className="flex flex-col justify-center w-auto h-auto my-4">
                    <label htmlFor="">correo</label>
                    <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' name='email' id='email'/>
                    <label htmlFor="">contraseña</label>
                    <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id='password' name='password'/>
                    <button className="mt-4 self-center float-end px-3 py-1 rounded-md bg-darBlue text-white text-[18px]" type='submit'>iniciar sesion</button>
                </form>)}
                </Formik>
                <div className="self-center mt-3">
                    <p className="">No tienes cuenta <Link className="hover:text-violet-500 hover:underline" href='/registro'>registrate</Link></p>
                </div>
            </div>
        </div>
    )
}