const express = require("express");
const app = express();

app.get('/', function (req, res) {
    res.send('Ingrese el enspoint que desea iniciar e.g.endpoint1');
  });

app.get('/endpoint1', function (req, res) {
    res.send('Resultado del endPoint1');
  });
  
  app.get('/endpoint2', function (req, res) {
    res.send('Resultado del endPoint2');
  });
  app.get('/endpoint3', function (req, res) {
    res.send('Resultado del endPoint3');
  });
  app.get('/endpoint4', function (req, res) {
    res.send('Resultado del endPoint4');
  });
  app.get('/endpoint5', function (req, res) {
    res.send('Resultado del endPoint5');
  });
  app.get('/endpoint6', function (req, res) {
    res.send('Resultado del endPoint6');
  });
app.listen(3000, () => {
 console.log("El servidor está inicializado en el puerto 3000");
});