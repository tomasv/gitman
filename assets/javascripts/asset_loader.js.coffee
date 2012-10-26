class GitMan.AssetLoader
  constructor: (@assets) ->
    @counter = 0
    for type, items of @assets
      @counter += Object.keys(items).length

  load: (callback) ->
    @callback = callback
    @images = {}
    @sounds = {}
    console.log("Loading #{@counter} assets...")
    for type, items of @assets
      for name, url of items
        @loadAsset(type, name, url)

  loadAsset: (type, name, url) ->
    switch type
      when 'images' then @loadImage(name, url)
      when 'sounds' then @loadSound(name, url)

  loadImage: (name, url) ->
    image = new Image()
    image.onload = =>
      @images[name] = image
      @assetLoaded(name)
    image.src = url

  loadSound: (name, url) ->
    sound = new GitMan.Sound(url)
    @sounds[name] = sound
    @assetLoaded(name)

  assetLoaded: (name) ->
    console.log("Asset #{name} loaded")
    @counter--
    if @counter == 0
      console.log("Loading done.")
      @callback()
