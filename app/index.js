// Generated by CoffeeScript 1.3.3
var app, assets, coffee, express, indicadores, partials, port, stylus;

express = require('express');

partials = require('express-partials');

stylus = require('stylus');

assets = require('connect-assets');

coffee = require('coffee-script');

indicadores = require('../modules/indicadores');

app = express();

app.use(assets());

app.set('view engine', 'jade');

app.use(express["static"]("" + __dirname + "/public"));

app.param('uf', indicadores.verifica_unidade);

app.get('/:uf', indicadores.home);

port = process.env.PORT || process.env.VMC_APP_PORT || 3000;

app.listen(port, function() {
  return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
});
