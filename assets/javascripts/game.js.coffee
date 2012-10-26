class GitMan.Game
  fps: 30

  manifest:
    player: 'assets/player.png'
    player_anim: 'assets/player_anim.png'
    block: 'assets/block.png'

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

    @entities.push new GitMan.Block(x: 50, y: 50)
    @entities.push new GitMan.Block(x: 150, y: 20)
    @entities.push new GitMan.Block(x: 200, y: 150)
    @entities.push new GitMan.Block(x: 10, y: 200)

    @player = new GitMan.Player()
    @player2 = new GitMan.Player(x: 32 * 5, y: 32 * 2)
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
    entity.draw?(@canvas) for entity in @entities

  frameInterval: ->
    1000 / @fps

