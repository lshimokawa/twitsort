require 'sinatra'
require 'sinatra/base'
require 'erb'
require 'twitter'

get '/' do
  erb :index
end

post '/' do
  users = Array.new
  Twitter::Search.new.hashtag(params[:hashtag]).per_page(100).each do |tweet|
    users << tweet.from_user unless users.include? tweet.from_user
  end
  @users_list = users.join ', '
  @winner = users[rand(users.size)]
  
  erb :index
end