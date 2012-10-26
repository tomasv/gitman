class GitMan.Sound
  constructor: (@url) ->

  play: ->
    new Audio(@url).play()
