class GitMan.EventHandler
  codes:
    66: 'b'
    72: 'h'
    74: 'j'
    75: 'k'
    76: 'l'

  constructor: ->
    @reset()
    $(window).on 'keydown', @keyDown.bind(this)
    $(window).on 'keyup', @keyUp.bind(this)
    $('canvas').on 'click', @click.bind(this)

  keyDown: (event) ->
    key = @codes[event.keyCode]
    @trigger('keydown', key)
    @trigger(key, 'down')

  keyUp: (event) ->
    key = @codes[event.keyCode]
    #@trigger(key, 'up')
  
  click: (event) ->
    canvas = $(event.target)
    coords =
      x: event.pageX - canvas.offset().left,
      y: event.pageY - canvas.offset().top
    @trigger('click', coords)

  on: (key, callback) ->
    return this unless key?
    @callbacks[key] ?= []
    @callbacks[key].push callback
    this

  trigger: (key, message) ->
    callbacks = @callbacks[key] ? []
    for callback in callbacks
      callback.call(this, message)

  reset: ->
    @callbacks = {}

