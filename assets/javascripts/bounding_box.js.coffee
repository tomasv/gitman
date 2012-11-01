class GitMan.BoundingBox
  @fromEntity: (entity) ->
    new @(entity.x, entity.y, entity.width, entity.height)

  constructor: (@x, @y, @w, @h) ->
    @x2 = @x + @w
    @y2 = @y + @h

  moved: (dx, dy) ->
    new GitMan.BoundingBox(@x + dx, @y + dy, @w, @h)

  collidesWith: (boxes) ->
    return false unless boxes?
    boxes = [boxes] unless boxes instanceof Array

    colliding = false
    for box in boxes
      if @collidesWithBox(box)
        colliding = true
        break
    colliding

  collidesWithBox: (box) ->
    xCollision = @x <= box.x <= @x2
    x2Collision = @x <= box.x2 <= @x2
    yCollision = @y <= box.y <= @y2
    y2Collision = @y <= box.y2 <= @y2
    (xCollision or x2Collision) and (yCollision or y2Collision)
    
