const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;


// Configuración EJS y carpeta de vistas
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));


// Archivos estáticos (css, imágenes locales si las agregas)
app.use(express.static(path.join(__dirname, 'public')));


// Ruta: pantalla de inicio
app.get('/', (req, res) => {
    res.render('index', { title: 'Inicio' });
});


// Ruta: pantalla del gatito
app.get('/gatito', (req, res) => {
    // Puedes cambiar la URL de la imagen por una tuya en public/ si prefieres
    const gatito = {
        nombre: 'Gatito',
        descripcion: 'Un tierno gatito renderizado en la pantalla del servidor',
        // imagen desde placekitten (servicio de imágenes de ejemplo)
        imagenUrl: 'https://imgs.search.brave.com/iWcTYLkNz7_ochBFQPsMxknh8HptffMZjnjnX0-pIv4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/MDIxOTc5OS9waG90/by9wbGF5ZnVsLWNh/dC1zY290dGlzaC1z/dHJpZ2h0LXNpdHRp/bmctd2l0aC1wYXct/cmFpc2VkLXVwLWlz/b2xhdGVkLW9uLXdo/aXRlLWJhY2tncm91/bmQuanBnP3M9NjEy/eDYxMiZ3PTAmaz0y/MCZjPW5ZS2o4aGo4/UldhMGp5T1JJNGpD/S1JzU3lYdjFFelBv/LWlueW1FbVcyTTg9'
    };
    res.render('gatito', { title: 'Gatito', gatito });
});


// Inicio del servidor
app.listen(PORT, () => {
    console.log(`Servidor iniciado en http://localhost:${PORT}`);
});