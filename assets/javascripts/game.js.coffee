class GitMan.Game
  fps: 30

  assets:
    images:
      player: 'assets/player.png'
      player_anim: 'assets/player_anim.png'
      block: 'assets/block.png'
      title_screen: 'assets/title_screen.png'
    sounds:
      beep: 'assets/beep.wav'

  constructor: (selector) ->
    @canvasElement = $(selector).get(0)
    @assetLoader = new GitMan.AssetLoader(@assets)
    @eventHandler = new GitMan.EventHandler()
    @assetLoader.load @start.bind(this)

  start: ->
    @canvas = new GitMan.Canvas(@canvasElement, @assetLoader.images)
    @setScene(new GitMan.TitleScreen(this))
    @running = true
    @loop()

  setScene: (scene) ->
    @eventHandler.reset()
    scene.setup()
    @scene = scene

  loop: ->
    return unless @running
    @update()
    @draw()
    setTimeout(@loop.bind(this), @frameInterval())

  update: ->
    entity.update?(@scene.entities) for entity in @scene.entities

  draw: ->
    @canvas.clear()
    entity.draw?(@canvas) for entity in @scene.entities

  frameInterval: ->
    1000 / @fps

