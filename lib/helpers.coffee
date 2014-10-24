colors = require 'colors'
path   = require 'path'
fs     = require 'fs'

exports.sendResponse = (req, res) ->
  json  = fs.readFileSync path.join(__dirname, '..', 'src', 'ibm-cloud-site-chrome', 'dist', 'content.json'), 'utf8'
  jsonp = "MarkupAPI.render(" + json + ");"

  if req.query.hasOwnProperty 'callback'
    res.send jsonp
  else
    res.send json

exports.logRequest = (url, status) ->
  if process.env.NODE_ENV != 'test'
    console.log status + ' ' + url

exports.logServerStart = (server) ->
  console.log 'Listening on port %d'.green, server.address().port
