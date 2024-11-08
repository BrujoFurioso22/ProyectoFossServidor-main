import express from "express";
import cors from "cors";
import https from "https";
import fs from "fs";
import mysql from "mysql2"
import userRoutes from "./Usuarios/userRoutes.js";
import profesorRoutes from "./Profesor/profesorRoutes.js";
import juegosRoutes from "./Juegos/juegosRoutes.js";
import adminRoutes from "./Administrador/adminRoutes.js";

const app = express();
app.use(express.json());
app.use(cors({
  origin: 'https://foss.uazuay.edu.ec'
}));
app.use(express.static('public'));

const httpsOptions = {
  key: fs.readFileSync("/etc/pki/nginx/private/uazuay.key"),
  cert: fs.readFileSync("/etc/pki/nginx/uazuay.crt")
  //ca: [
  //  fs.readFileSync('/ruta/de/CA_root.crt'),
  //  fs.readFileSync('/ruta/de/CA-bundle.crt')
  //]
};

// Redirige todas las solicitudes HTTP a HTTPS
app.use((req, res, next) => {
  if (req.secure) {
    next();
  } else {
    res.redirect('https://${req.headers.host}${req.url}');
  }
});

app.get("/", (req, res) => {
  return res.json("FROM BACKEND SIDE");
});

app.use("/usuarios", userRoutes);
app.use("/profesor", profesorRoutes);
app.use("/juegos", juegosRoutes);
app.use("/admin", adminRoutes);

https.createServer(httpsOptions, app).listen(8443, () => {
  console.log("Listening 8443 (HTTPS)");
});