express = require('express')
fs      = require('fs')
app     = express()

port = process.env.PORT || 4000

json  = fs.readFileSync './src/nav.json', 'utf8'
jsonp = "MarkupAPI.render(" + json + ");"

logRequest = (url, status) ->
  console.log 'Request for: ' + url + ' (' + status + ')'

app.get '/api/v1/cloud.json', (req, res) ->
  logRequest req.url, res.statusCode

  res.header 'Content-Type', 'application/json'
  res.header 'Charset', 'utf-8'

  if req.query.hasOwnProperty 'callback'
    res.send jsonp
  else
    res.send json

app.get '/*', (req, res) ->
  logRequest req.url, res.statusCode

  res.status 404
  res.send
    error: 404,
    message: 'Not Found',
    documentation: 'https://github.com/mmwtsn/markup-api#markup-api'

server = app.listen port, ->
  console.log 'Listening on port %d', server.address().port
