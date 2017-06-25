require 'sinatra/base'
require_relative './lib/game'

class AppleTree < Sinatra::Base

  get '/' do
    @game = Game.new
    erb :index
  end

  run! if app_file == $0
end
