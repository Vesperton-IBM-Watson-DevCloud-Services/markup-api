express = require 'express'
router  = express.Router()

helpers = require '../helpers'

router.get '/', (req, res) ->
  res.header 'Charset', 'utf-8'
  res.type 'application/json'

  helpers.logRequest req.url, res.statusCode

  res.status 404
  res.send
    error: 404,
    message: 'Not Found',
    documentation: 'https://github.com/mmwtsn/markup-api#markup-api'

module.exports = router
