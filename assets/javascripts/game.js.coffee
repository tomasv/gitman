class GitMan.Game
  fps: 30

  manifest:
    player: 'assets/player.png'
    player_anim: 'assets/player_anim.png'

  constructor: (selector) ->
    @canvasElement = $(selector).get(0)
    @canvas = new GitMan.Canvas(@canvasElement)
    @imageLoader = new GitMan.ImageLoader(@manifest)
    @eventHandler = new GitMan.EventHandler()
    @imageLoader.load @imagesLoaded.bind(this)

  imagesLoaded: ->
    @start()

  captureEvents: ->
    @eventHandler.on 'h', => @player.left()
    @eventHandler.on 'j', => @player.down()
    @eventHandler.on 'k', => @player.up()
    @eventHandler.on 'l', => @player.right()

  start: ->
    @captureEvents()
    @canvas.images = @imageLoader.images
    @entitySetup()
    @running = true
    @loop()

  entitySetup: ->
    @entities = []
    @player = new GitMan.Player(this)
    @player2 = new GitMan.Player(this)
    @player2.x = 32 * 5
    @player2.y = 32 * 2

    @chaser = new GitMan.Chaser(@player2, @player)

    @entities.push(@player2)
    @entities.push(@player)
    @entities.push(@chaser)

  loop: ->
    return unless @running
    @tick()
    setTimeout(@loop.bind(this), @frameInterval())

  tick: ->
    @update()
    @draw()

  update: ->
    entity.update?() for entity in @entities

  draw: ->
    @canvas.clear()
    entity.draw?() for entity in @entities

  frameInterval: ->
    1000 / @fps

