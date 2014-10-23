request = require 'supertest'
express = require 'express'
assert  = require 'assert'

process.env.NODE_ENV = 'test'
app = require '../lib/server'

describe 'app server', ->

  it 'is running', (done) ->
    request(app)
      .get('/')
      .expect 404, done

  it 'responds with valid json', (done) ->
    request(app)
      .get('/v1/cloud.json')
      .expect('Content-Type', /json/)
      .expect 200, done
