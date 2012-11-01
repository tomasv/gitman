class GitMan.Game
  fps: 30

  width: 320
  height: 240

  assets:
    images:
      player: 'assets/player.png'
      player_anim: 'assets/player_anim.png'
      block: 'assets/block.png'
      title_screen: 'assets/title_screen.png'
      start: 'assets/start.png'
      controls: 'assets/controls.png'
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
    frameStart = new Date()
    return unless @running
    @update()
    @draw()
    frameEnd = new Date()
    frameDuration = frameEnd - frameStart
    waitTime = @frameInterval() - frameDuration
    setTimeout(@loop.bind(this), waitTime)

  update: ->
    entity.update?(@scene.entities) for entity in @scene.entities

  draw: ->
    @canvas.clear()
    entity.draw?(@canvas) for entity in @scene.entities

  frameInterval: ->
    1000 / @fps

