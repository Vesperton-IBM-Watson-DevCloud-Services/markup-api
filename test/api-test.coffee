request = require 'supertest'
express = require 'express'
assert  = require 'assert'

process.env.NODE_ENV = 'test'
app = require '../lib/server'

describe 'app server', ->

  it '"GET /" responds with 404', (done) ->
    request(app)
      .get('/')
      .expect 404, done

  it '"GET /v1/cloud.json" responds with 200', (done) ->
    request(app)
      .get('/v1/cloud.json')
      .expect 200, done
