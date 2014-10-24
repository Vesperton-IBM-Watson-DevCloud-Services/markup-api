express = require('express')
path    = require('path')
app     = express()

helpers = require './helpers'
api     = require './routes/api'
splat   = require './routes/404'

port  = process.env.PORT || 5000

app.use express.static path.join(__dirname, '..', 'public')
app.use '/v1/cloud.json', api
app.use '/*', splat

server = app.listen port, ->
  helpers.logServerStart server

module.exports = app
