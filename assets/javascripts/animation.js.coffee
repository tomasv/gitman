class GitMan.Animation
  constructor: (@entity, details) ->
    @frameCounter = 0
    for name, value of details
      @[name] = value

  update: ->
    @frameCounter++
    @frameCounter = 0 if @frameCounter > @frames

  draw: (canvas) ->
    yFrame = @animations[@currentAnimation]
    xFrame = @frameCounter % @frames

    xOffset = xFrame * @width
    yOffset = yFrame * @height

    canvas.drawFrame(
      @image,
      xOffset, yOffset, @width, @height,
      @entity.x, @entity.y, @width, @height
    )
