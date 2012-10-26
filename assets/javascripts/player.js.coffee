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

  update: ->
    @x += @dx
    @y += @dy

    @dx = Math.round(@dx * 0.4)
    @dy = Math.round(@dy * 0.4)

    @animation.update() if @isMoving()

  up:    -> @dy = -@speed
  down:  -> @dy = +@speed
  left:  -> @dx = -@speed
  right: -> @dx = +@speed
    

