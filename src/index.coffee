express = require 'express'
partials = require 'express-partials'
stylus = require 'stylus'
assets = require 'connect-assets'
coffee = require 'coffee-script'
# horrible!!! show me a better way to...
indicadores = require '../modules/indicadores'

#r = require './src/indicadores.coffee'

app = express()

# Add Connect Assets
app.use assets()

# Set View Engine
app.set 'view engine', 'jade'

# UF's sanity check!
app.param 'uf', indicadores.verifica_unidade

# precisa configurar os headers no response
app.get '/:uf', indicadores.home

# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."