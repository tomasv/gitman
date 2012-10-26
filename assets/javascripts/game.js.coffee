class GitMan.Game
  fps: 30

  assets:
    images:
      player: 'assets/player.png'
      player_anim: 'assets/player_anim.png'
      block: 'assets/block.png'
    sounds:
      beep: 'assets/beep.wav'

  constructor: (selector) ->
    @canvasElement = $(selector).get(0)
    @assetLoader = new GitMan.AssetLoader(@assets)
    @eventHandler = new GitMan.EventHandler()
    @assetLoader.load @start.bind(this)

  captureEvents: ->
    @eventHandler.on 'h', => @player.left()
    @eventHandler.on 'j', => @player.down()
    @eventHandler.on 'k', => @player.up()
    @eventHandler.on 'l', => @player.right()
    @eventHandler.on 'b', => @assetLoader.sounds.beep.play()

  start: ->
    @canvas = new GitMan.Canvas(@canvasElement, @assetLoader.images)
    @captureEvents()
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
    @update()
    @draw()
    setTimeout(@loop.bind(this), @frameInterval())

  update: ->
    entity.update?(@entities) for entity in @entities

  draw: ->
    @canvas.clear()
    entity.draw?(@canvas) for entity in @entities

  frameInterval: ->
    1000 / @fps

