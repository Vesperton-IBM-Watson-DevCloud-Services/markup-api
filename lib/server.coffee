express = require('express')
path    = require('path')
app     = express()
helpers = require './helpers'

module.exports = app
app.use express.static path.join(__dirname, '..', 'public')

app.get '/v1/cloud.json', (req, res) ->
  helpers.logRequest req.url, res.statusCode

  res.header 'Content-Type', 'application/json'
  res.header 'Charset', 'utf-8'

  helpers.sendResponse req, res

app.get '/*', (req, res) ->
  helpers.logRequest req.url, res.statusCode

  res.header 'Content-Type', 'application/json'
  res.header 'Charset', 'utf-8'

  res.status 404
  res.send
    error: 404,
    message: 'Not Found',
    documentation: 'https://github.com/mmwtsn/markup-api#markup-api'

port  = process.env.PORT || 3000

server = app.listen port, ->
  helpers.logServerStart server
