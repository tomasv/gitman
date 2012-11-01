class GitMan.Gravity
  acceleration: 4

  constructor: (options) ->
    for name, value of options
      @[name] = value

  update: (entities) ->
    @applyGravity(entity) for entity in entities

  applyGravity: (entity) ->
    entity.y = entity.y + entity.dy

    maxHeight = 240 - entity.height

    if entity.y > maxHeight
      entity.y = maxHeight
      entity.dy = 0
    else
      entity.dy += @acceleration

