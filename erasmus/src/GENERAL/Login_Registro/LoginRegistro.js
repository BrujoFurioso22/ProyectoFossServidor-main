import React, { useState } from "react";
import styled from "styled-components";

// import {
//   Container,
//   ContainerPadre,
//   FormContainer,
//   Overlay,
//   OverlayContainer,
//   OverlayPanel,
//   SignInContainer,
//   SignUpContainer,
// } from "STYLED-COMPONENTS/Login";
import "GENERAL/Login_Registro/LoginReg.css";
import logo from "SOURCES/logo-uazuay.png";

import { Registrarse } from "GENERAL/Login_Registro/RegistrarseForm";
import { InicioSesion } from "GENERAL/Login_Registro/InicioSesionForm";

const ContendorPadre = styled.div`
  background: #f6f5f7;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: "Montserrat", sans-serif;
  box-sizing: border-box;
  height: 100vh;
  position: "relative";
`;

export const LoginRegistro = () => {
  const [type, setType] = useState("signIn");
  const handleOnClick = (text) => {
    if (text !== type) {
      setType(text);
      return;
    }
  };
  const containerClass =
    "container " + (type === "signUp" ? "right-panel-active" : "");
  return (
    <ContendorPadre>
      <div
        style={{
          width: "100%",
          height: "max-content",
          position: "absolute",
          top: 0,
          left: 0,
          backgroundColor: "var(--color-u1)",
          display: "flex",
          justifyContent: "center",
        }}
      >
        <a
          style={{ width: "100%", display: "flex", justifyContent: "center" }}
          href="https://www.uazuay.edu.ec/"
        >
          <img
            style={{
              backgroundColor: "var(--color-u1)",
              padding: "10px",
              objectFit: "contain",
              height: "70px",
            }}
            alt="LogoUDA"
            src={logo}
          ></img>
        </a>
      </div>
      <div className={containerClass} id="container">
        <Registrarse />
        <InicioSesion />
        <div className="overlay-container">
          <div className="overlay">
            <div className="overlay-panel overlay-left">
              <h1 className="h1Login">Bienvenido!</h1>
              <p className="pLogin">
                ¿Ya tienes una cuenta? Inicia sesión ahora.
              </p>
              <button
                className="botonLogin ghost"
                id="signIn"
                onClick={() => handleOnClick("signIn")}
              >
                Iniciar Sesión
              </button>
            </div>
            <div className="overlay-panel overlay-right">
              <h1 className="h1Login">Hola, ¿necesitas una cuenta?</h1>
              <p className="pLogin">
                Llena la información necesaria para registrarte en nuestra
                plataforma
              </p>
              <button
                className="botonLogin ghost"
                id="signUp"
                onClick={() => handleOnClick("signUp")}
              >
                Registrarse
              </button>
            </div>
          </div>
        </div>
      </div>
    </ContendorPadre>
  );
};
