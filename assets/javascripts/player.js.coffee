class GitMan.Player
  image: 'player_anim'
  height: 32
  width: 32

  frames: 4
  animations:
    right: 0
    left: 1

  speed: 10

  constructor: (@game) ->
    @currentAnimation = 'right'
    @frameCounter = 0
    @x = 0
    @y = 0
    @dx = 0
    @dy = 0

  draw: ->

    if @dx > 0
      @currentAnimation = 'right'
    else if @dx < 0
      @currentAnimation = 'left'

    @adx = Math.abs(@dx)
    @ady = Math.abs(@dy)

    if @adx > 0 or @ady > 0
      @frameCounter++
      @frameCounter = 0 if @frameCounter > @frames

    @yFrame = @animations[@currentAnimation]
    @xFrame = @frameCounter % @frames

    @xOffset = @xFrame * @width
    @yOffset = @yFrame * @height

    @game.canvas.drawFrame(
      @image,
      @xOffset, @yOffset, @width, @height,
      @x, @y, @width, @height
    )

  update: ->
    @x += @dx
    @y += @dy

    @dx = Math.round(@dx * 0.4)
    @dy = Math.round(@dy * 0.4)

  up:    -> @dy = -@speed
  down:  -> @dy = +@speed
  left:  -> @dx = -@speed
  right: -> @dx = +@speed
    

