class GitMan.MainMenu extends GitMan.Scene
  setup: ->
    @start = new GitMan.MenuItem(image: 'start', x: 80, y: 40, selected: true)
    @controls = new GitMan.MenuItem(image: 'controls', x: 80, y: 72)

    @add @start
    @add @controls

    @on 'keydown', (key) =>
      actions =
        j: @down
        l: @up
        enter: @select
      actions[key]()

  down: =>
    @toggle()

  up: =>
    @toggle()

  toggle: ->
    @start.selected = !@start.selected
    @controls.selected = !@controls.selected

  select: =>
    if @start.selected
      @game.setScene(new GitMan.World(@game))
    else
      console.log('controls')

