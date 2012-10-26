Bundler.require

class GitMan
  class App < Sinatra::Base
    get '/' do
      erb :index
    end
  end

  def app
    @app ||= App.new
  end

  def sprockets_environment
    @sprockets_environment ||= Sprockets::Environment.new do |e|
      e.append_path 'assets/javascripts'
      e.append_path 'assets/images'
      e.append_path 'assets/sounds'
      e.append_path 'assets/stylesheets'
      e.append_path 'vendor/assets/javascripts'
    end
  end
end
