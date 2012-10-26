Bundler.require

environment = Sprockets::Environment.new

environment.append_path 'assets/javascripts'
environment.append_path 'assets/images'
environment.append_path 'assets/sounds'
environment.append_path 'assets/stylesheets'

environment.append_path 'vendor/assets/javascripts'

map '/assets' do
  run environment
end

get '/' do
  erb :index
end

map '/' do
  run Sinatra::Application
end
