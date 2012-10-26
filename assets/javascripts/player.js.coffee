class GitMan.Player
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
    @animation.drawAnimation(canvas)

  isMoving: ->
    adx = Math.abs(@dx)
    ady = Math.abs(@dy)
    adx > 0 or ady > 0

  update: (world) ->
    newX = @x + @dx
    newY = @y + @dy

    colliding = false
    for entity in world when entity != this
      colliding = true if @collideWithAt(entity, newX, newY)

    unless colliding
      @x = newX
      @y = newY

    @dx = Math.round(@dx * 0.4)
    @dy = Math.round(@dy * 0.4)

    @animation.update() if @isMoving()

  collideWithAt: (entity, newX, newY) ->
    xCollision = entity.x <= newX <= entity.x + entity.width
    x2Collision = entity.x <= newX + @width <= entity.x + entity.width
    yCollision = entity.y <= newY <= entity.y + entity.height
    y2Collision = entity.y <= newY + @height <= entity.y + entity.height
    (xCollision or x2Collision) and (yCollision or y2Collision)

  up:    -> @dy = -@speed
  down:  -> @dy = +@speed
  left:  -> @dx = -@speed
  right: -> @dx = +@speed

