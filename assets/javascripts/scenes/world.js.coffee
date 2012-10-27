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

    @on 'keydown', (key) =>
      actions =
        h: => @player.left()
        j: => @player.down()
        k: => @player.up()
        l: => @player.right()
        b: => @assetLoader.sounds.beep.play()
      actions[key]()

