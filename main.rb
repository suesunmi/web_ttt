require 'sinatra'
$: << File.dirname(__FILE__) + '/lib/'
require File.dirname(__FILE__) + '/lib/ttt_interactor.rb'

get '/' do
  erb :preference_collection
end

post '/begin' do
  number_players = params[:number_players]
  @tttInteractor = tttInteractor.new
  board = @tttInteractor.starting_board(@number_players)
  erb :game, :locals => { :number_players => number_players, :board => board }
end

put '/game' do
  number_players = params[:number_players]
  board = params[:board]
  position = params[:position]
  @tttInteractor = tttInteractor.new
  ttt_response = @tttInteractor.response(number_players, board, position)  #board has been updated
  erb ttt_response.erb, :locals => ttt.response.locals
  # erb :game, :locals => { :number_players => n, :board => b }
  # erb :finish, :locals => { :winner => w }
end
