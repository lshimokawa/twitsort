require 'sinatra'
require 'sinatra/base'
require 'erb'
require 'twitter'

get '/' do
  erb :index
end

post '/' do
  @users = []
  Twitter::Search.new.hashtag(params[:hashtag]).per_page(100).each do |tweet|
    @users << tweet.from_user unless @users.include? tweet.from_user
  end
  
  @winner = @users.shuffle.first
  erb :index
end