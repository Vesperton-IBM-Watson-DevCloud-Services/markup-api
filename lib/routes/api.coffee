express = require 'express'
router  = express.Router()

helpers = require '../helpers'

router.get '/', (req, res) ->
  res.header 'Charset', 'utf-8'
  res.type 'application/json'

  helpers.logRequest req.url, res.statusCode

  res.status 200
  helpers.sendResponse req, res

module.exports = router
