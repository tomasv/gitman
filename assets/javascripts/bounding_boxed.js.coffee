GitMan.BoundingBoxed =
  boundingBoxed: true
  getBoundingBox: ->
    GitMan.BoundingBox.fromEntity(this)

