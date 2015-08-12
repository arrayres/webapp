Rx = require 'rx'

{ simulationsResource } = require '../resources'
dispatcher = require '../dispatcher'

module.exports = Rx.Observable
  .fromEvent dispatcher, 'simulation'
  .flatMap (payload) ->
    simulationsResource.create payload
      .then (data) ->
        request: payload
        response: data
