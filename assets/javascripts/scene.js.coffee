class GitMan.Scene
  constructor: (@game) ->
    @eventHandler = @game.eventHandler
    @assetLoader = @game.assetLoader
    @entities = []

  add: (entity) ->
    @entities.push(entity)

  on: ->
    @eventHandler.on.apply(@eventHandler, arguments)
