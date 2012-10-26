Bundler.require

require 'rake/sprocketstask'
require './app'

sprockets = GitMan.new.sprockets_environment

Rake::SprocketsTask.new do |t|
  t.environment = sprockets
  t.output = "./public/assets"
  t.assets = %w( application.js application.css )
end
