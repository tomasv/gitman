require './gitman'

gitman = Gitman.new

map '/assets' do
  run gitman.sprockets_environment
end

map '/' do
  run gitman.app
end
