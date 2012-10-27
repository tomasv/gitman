class GitMan.TitleScreen extends GitMan.Scene
  setup: ->
    @add new GitMan.Block(image: 'title_screen')
    @on 'click', @continue
    @on 'keydown', @continue

  continue: =>
    @game.setScene(new GitMan.MainMenu(@game))

