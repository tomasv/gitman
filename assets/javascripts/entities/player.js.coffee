class GitMan.Player
  @mixin GitMan.BoundingBoxed

  height: 32
  width: 32
  x: 0
  y: 0
  dx: 0
  dy: 0

  speed: 10

  constructor: (config) ->
    for name, value of config
      @[name] = value

    @animation = new GitMan.Animation this,
      image: 'player_anim'
      width: 32
      height: 32
      frames: 4
      currentAnimation: 'right'
      animations:
        right: 0
        left: 1

  draw: (canvas) ->
    if @dx > 0
      @animation.currentAnimation = 'right'
    else if @dx < 0
      @animation.currentAnimation = 'left'
    @animation.draw(canvas)

  update: (entities) ->
    @move(entities)
    @slowDown()
    @animation.update() if @isMoving()

  move: (entities) ->
    box = @getBoundingBox().moved(@dx, @dy)
    colliding = box.collidesWith(entities)
    unless colliding
      @x = box.x
      @y = box.y

  slowDown: ->
    @dx = Math.round(@dx * 0.4)
    @dy = Math.round(@dy * 0.4)

  isMoving: ->
    adx = Math.abs(@dx)
    ady = Math.abs(@dy)
    adx > 0 or ady > 0

  up:    -> @dy = -@speed
  down:  -> @dy = +@speed
  left:  -> @dx = -@speed
  right: -> @dx = +@speed

