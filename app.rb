require 'sinatra/base'
require_relative './lib/game'

class AppleTree < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/game/new' do
    session[:game] = Game.new
    redirect '/game'
  end

  get '/game' do
    @game = session[:game]
    erb :game
  end

  post '/guess' do
    session[:game].guess(params[:guess])
    redirect '/game'
  end

  get '/testgame' do
    session[:game] = Game.new('teacup')
    redirect '/game'
  end

  run! if app_file == $0
end
