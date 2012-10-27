class GitMan.World extends GitMan.Scene
  setup: ->
    @add new GitMan.Block(x: 50, y: 50)
    @add new GitMan.Block(x: 150, y: 20)
    @add new GitMan.Block(x: 200, y: 150)
    @add new GitMan.Block(x: 10, y: 200)

    @player = new GitMan.Player()
    @player2 = new GitMan.Player(x: 32 * 5, y: 32 * 2)
    @chaser = new GitMan.Chaser(@player2, @player)

    @add @player2
    @add @player
    @add @chaser

    @on 'h', => @player.left()
    @on 'j', => @player.down()
    @on 'k', => @player.up()
    @on 'l', => @player.right()
    @on 'b', => @assetLoader.sounds.beep.play()

