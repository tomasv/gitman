class GitMan.MainMenu extends GitMan.Scene
  setup: ->
    @add new GitMan.Block(x: 150, y: 150)
    @on 'h', => @game.setScene(new GitMan.World(@game))
    @on 'click', (coords) =>
      console.log(coords)

