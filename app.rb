require 'sinatra/base'
require_relative './lib/game'

class AppleTree < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/game/new' do
    levels = {"easy" => "4", "intermediate" => "6", "difficult" => "8"}
    session[:game] = Game.new(WordMaker.new(levels[params[:level]]))
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

  run! if app_file == $0
end
