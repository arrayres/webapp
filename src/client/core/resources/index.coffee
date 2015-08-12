'use strict'

Resource = require './Resource'

module.exports =
  usersResource: new Resource 'users'
  assetsResource: new Resource 'assets'
  graphsResource: new Resource 'graphs'
  simulationsResource: new Resource 'simulations'
  strategiesResource: new Resource 'strategies'
