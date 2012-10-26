class GitMan.ImageLoader
  constructor: (@manifest) ->
    @counter = Object.keys(@manifest).length

  load: (callback) ->
    @callback = callback
    @images = {}
    console.log("Loading #{@counter} images...")
    for name, url of @manifest
      @loadImage(name, url)

  loadImage: (name, url) ->
    image = new Image()
    image.onload = =>
      @images[name] = image
      console.log("Image #{name} loaded")
      @counter--
      console.log("Loading done.")
      if @counter == 0
        @callback()
    image.src = url

