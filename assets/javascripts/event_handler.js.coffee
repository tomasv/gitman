class GitMan.EventHandler
  codes:
    66: 'b'
    72: 'h'
    74: 'j'
    75: 'k'
    76: 'l'

  constructor: ->
    @callbacks = {}
    $(window).on 'keydown', @keyDown.bind(this)
    $(window).on 'keyup', @keyUp.bind(this)

  keyDown: (event) ->
    key = @codes[event.keyCode]
    @trigger(key, 'down')

  keyUp: (event) ->
    key = @codes[event.keyCode]
    #@trigger(key, 'up')

  on: (key, callback) ->
    return this unless key?
    @callbacks[key] ?= []
    @callbacks[key].push callback
    this

  trigger: (key, message) ->
    callbacks = @callbacks[key] ? []
    for callback in callbacks
      callback.call(this, message)

