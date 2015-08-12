'use strict'

api = require '../modules/api'

module.exports = class Resource
  constructor: (@resourceName) ->
  fetchAll: -> api.get "#{@resourceName}/"
  fetch: (id) -> api.get "#{@resourceName}/#{id}"
  create: (content) -> api.post @resourceName, content
  update: (id, content) -> api.put "#{@resourceName}/#{id}", content
  delete: (id) -> api.delete "#{@resourceName}/#{id}"
