class GitMan.Block
  image: 'block'
  x: 0
  y: 0
  height: 32
  width: 32

  constructor: (config) ->
    for name, value of config
      @[name] = value

  draw: (canvas) ->
    canvas.drawImage(@image, @x, @y)

