require 'sinatra'
# require 'sinatra/reloader' #reload the sinatra webpage
# require 'pry' #load in pry
require 'pg' #to connect to postgres


require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/leader'
require_relative 'models/vote'

enable :sessions

helpers do

 def clicked?
   @votes = Vote.all
   @votes.each do |vote|
     if (vote(params[:emoji_value]).nil? || vote(params[:emoji_id]).empty?) || (vote(params[:leader_id]).nil? || vote(params[:leader_id]).empty?)
       reject{vote}
     end
   end

  end

 def current_user
  User.find_by(id: session[:user_id])
  # case
 end
 def logged_in?
   !!current_user
 end
end

#display the list of contestants and finally display the total_count
get '/' do
  erb :index
end

post '/' do
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.save
  redirect to '/login'
end

#login page and list of all leaders
get '/login' do
  @leaders = Leader.all
  erb :login
end
# authenticate user
post '/session' do
  # identify user
  user = User.find_by({email: params[:email]})
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/all'
  else
    redirect to '/'
  end
end
#logging out of the session
delete '/session' do
  session[:user_id] = nil
  redirect to '/login'
end

#display the list of contestants along with the vote images.
get '/all' do
    @leaders = Leader.all
  erb :show
end

get '/votes' do
  redirect to '/login' if !logged_in?
    current_user.votes.create(emoji: params[:emoji_value], leader_id: params[:leader_id], emoji_value: params[:emo_value])
  redirect to '/finished_voting'
end

#display the finished_voting page upon clicking the image
get '/finished_voting' do
  erb :finished_voting
end

#identify the user action for emoji click or vote
#or upon clicking the image, add values or populate the leader table
#restrict the user to be able to use the emoji just once or deactivate the emoji once the emoji is clicked
# post '/all'
#   if
#   @leader = Leader.find_by(id: params[:id])
#   @user = User.find_by(session[:user_id])
#
# erb :show
# end
