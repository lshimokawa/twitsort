require 'sinatra'
require 'sinatra/base'
require "sinatra/reloader" if development?
require 'erb'
require 'twitter'

enable :sessions, :logging

helpers do
  def hashtag_link(hashtag)
    "<a href='http://twitter.com/#!/search/%23#{hashtag}'>##{hashtag}</a>"
  end

  def twitter_link(user)
    "<a href='http://twitter.com/#!/#{user}'>#{user}</a>"
  end
end

get '/' do
  erb :index
end

get '/search' do
  session[:users] = []
  Twitter::Search.new.hashtag(params[:hashtag]).per_page(100).each do |tweet|
    session[:users] << tweet.from_user unless session[:users].include? tweet.from_user
  end
  erb :index
end

get '/raffle' do 
  session[:users].shuffle.first
end