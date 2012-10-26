class GitMan.Chaser
  constructor: (@source, @target) ->

  update: ->
    return if Math.random() * 100 > 10

    dx = @source.x - @target.x
    dy = @source.y - @target.y

    adx = Math.abs(dx)
    ady = Math.abs(dy)

    return if adx < 32 and ady < 32

    if adx < ady
      if dy > 0
        @source.up()
      else
        @source.down()
    else
      if dx > 0
        @source.left()
      else
        @source.right()


