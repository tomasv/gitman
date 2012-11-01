Function::mixin = (functions) ->
  for name, value of functions
    @::[name] = value

Function::override = (name, newFunction) ->
  oldFunction = @::[name]
  @::[name] = (args...) ->
    args.splice(0, 0, oldFunction)
    newFunction.apply(this, args)
