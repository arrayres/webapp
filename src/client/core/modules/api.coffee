'use strict'

Promise = require 'promise'
dispatcher = require '../dispatcher'

#
# Generates HTTP fetch options for a given method.
# @param  {String} method HTTP verb.
# @return {Object}        HTTP fetch options.
#
generateOptions = (method, body) ->
  method: method
  body: JSON.stringify body
  credentials: 'same-origin'
  headers:
    'Accept': 'application/json'
    'Content-Type': 'application/json'

#
# Intercepts and notifices about authentication failures.
# @param  {Object} response HTTP fetch response.
# @throws {Error}           When backend responds with 401 error.
# @return {Object}          HTTP fetch response (identity).
#
interceptPossibleAuthFailure = (response) ->
  if response.status is 401
    dispatcher.emit 'auth', null
    throw new Error "#{response.status} #{response.statusText}"
  response

['get', 'post', 'put', 'delete'].forEach (method) ->
  exports[method] = (url, body) ->
    new Promise (resolve) -> resolve generateOptions method, body
      .then (options) -> fetch "/api/#{url}", options
      .then interceptPossibleAuthFailure
      .then (response) -> response.json()
