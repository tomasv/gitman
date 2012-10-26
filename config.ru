require './app'

git_man = GitMan.new

map '/assets' do
  run git_man.sprockets_environment
end

map '/' do
  run git_man.app
end
