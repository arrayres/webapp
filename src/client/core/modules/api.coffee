'use strict'

{ merge } = require 'ramda'
dispatcher = require '../dispatcher'

#
# Generates HTTP fetch options for a given method.
# @param  {String} method HTTP verb.
# @return {Object}        HTTP fetch options.
#
generateOptions = (method) ->
  method: method
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
authFailureInterceptor = (response) ->
  if response.status is 401
    dispatcher.emit 'auth', null
    throw new Error "#{response.status} #{response.statusText}"
  response

['get', 'post', 'put', 'delete'].forEach (method) ->
  fetchOptions = generateOptions method
  exports[method] = (url, customOptions) ->
    mergedOptions = merge fetchOptions, customOptions
    fetch "/api#{url}", mergedOptions
      .then authFailureInterceptor
      .then (response) -> response.json()
