require 'sinatra'
require 'sinatra/base'
require 'erb'
require 'twitter'

enable :sessions

helpers do
  def hashtag_link(hashtag)
    "<a href='http://twitter.com/#!/search/%23#{hashtag}'>##{hashtag}</a>"
  end
  
  def twitter_user_link(user)
    "<a href='http://twitter.com/#!/#{user}'>@#{user}</a>"
  end
end

get '/' do
  erb :index
end

get '/search' do
  users = []
  Twitter::Search.new.hashtag(params[:hashtag]).per_page(100).each do |tweet|
    users << tweet.from_user unless users.include? tweet.from_user
  end
  session[:users] = users
  erb :index
end

get '/raffle' do 
  session[:users].shuffle.first
end