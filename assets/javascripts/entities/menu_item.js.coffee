class GitMan.MenuItem
  height: 32
  width: 160
  x: 0
  y: 0

  constructor: (config) ->
    for name, value of config
      @[name] = value

    @animation = new GitMan.Animation this,
      image: @image
      width: @width
      height: @height
      frames: 1
      currentAnimation: 'inactive'
      animations:
        inactive: 0
        active: 1

  draw: (canvas) ->
    @animation.currentAnimation =
      if @selected
        'active'
      else
        'inactive'
    @animation.draw(canvas)

