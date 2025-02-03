'use client'

import { Formik, Field } from "formik";
import * as React from 'react';
import './registro.css'
import Link from "next/link";

export default function PageRegistro() {
  type registerValues = {
    username: string;
    mail: string;
    age: number;
    password: string;
  };

  const initialValues: registerValues = {
    username: "",
    mail: "",
    age: 0,
    password: "",
  };

  return (
    <div className="flex flex-col w-96 max-w-96 min-w-40 mx-auto my-10 justify-center bg-white p-10">
    <div className="flex flex-row my-2">
        {/* <Image src={'/logo.png'} alt="logo" width={150} height={150}/> */}
        <h1 className="self-center text-center text-3xl text-darBlue font-bold">REGISTRO</h1>
    </div>
      <Formik
        initialValues={initialValues}
        onSubmit={(values, actions) => {
          console.log(values, actions);
          actions.setSubmitting(false);
        }}
      >
        {() => (
          <form className="flex flex-col justify-center w-auto h-auto">
            <label htmlFor="username">Username</label>
            <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id="username" name="username" />

            <label htmlFor="mail">Mail</label>
            <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id="mail" name="mail" type="email" />

            <label htmlFor="age">Age</label>
            <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id="age" name="age" type="number" />

            <label htmlFor="password">Password</label>
            <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id="password" name="password" type="password" />

            <label htmlFor="confirm_password">Confirm Password</label>
            <Field className='border-b-2 border-b-darBlue p-2 focus:outline-none focus:ring-0 w-full mb-2' id="confirm_password" name="confirm_password" type="password" />

            <button className="mt-4 self-center float-end px-3 py-1 rounded-md bg-darBlue text-white text-[18px]" type="submit">Registrar</button>
          </form>
        )}
      </Formik>
      <div className="self-center mt-3">
        <p>Ya tienes cuenta? <Link className="hover:text-violet-500 hover:underline" href={'/login'}>iniciar sesion</Link></p>
      </div>
    </div>
  );
}

PageRegistro.props={
    hideComponent:true,
}