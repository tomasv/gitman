class GitMan.Canvas
  constructor: (@canvas, @images) ->
    @context = @canvas.getContext('2d')

  drawImage: (name, x, y) ->
    image = @getImage(name)
    @context.drawImage(image, x, y)

  drawFrame: (name, sx, sy, sw, sh, dx, dy, dw, dh) ->
    image = @getImage(name)
    @context.drawImage(image, sx, sy, sw, sh, dx, dy, dw, dh)

  clear: ->
    @context.clearRect(0, 0, 320, 240)

  getImage: (name) ->
    @images[name]
