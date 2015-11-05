# require 'sinatra'
# require 'sinatra/reloader' #reload the sinatra webpage
# require 'pry' #load in pry
# require 'pg' #to connect to postgres
#
#
# require_relative 'db_config'
# require_relative 'models/user'
# require_relative 'models/leader'
# require_relative 'models/vote'
#
# enable :sessions
#
# helpers do
#  # def emoji_value
#  # end
#
#  # def clicked?
#  #    if happy-emo.jpeg
#  #      emoji_value = 1
#  #    elsif angry-emo.jpeg
#  #      emoji_value = -1
#  #    else
#  #      break
#  #    end
#  #  end
#
#  def current_user
#   User.find_by(id: session[:user_id])
#   # case
#  end
#
# end
#
# #display the list of contestants and finally display the total_count
# get '/' do
#   erb :index
# end
#
# post '/' do
#   @user = User.new
#   @user.name = params[:name]
#   @user.email = params[:email]
#   @user.password = params[:password]
#   @user.save
#   redirect to '/login'
# end
#
# #display the list of contestants along with the vote images.
# get '/all' do
#   erb :show
# end
#
# #login page and list of all leaders
# get '/login' do
#   erb :login
# end
# # authenticate user
# post '/session' do
#   # identify user
#   user = User.find_by({email: params[:email]})
#   if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect to '/all'
#   else
#     redirect to '/'
#   end
# end
# #logging out of the session
# delete '/session' do
#   session[:user_id] = nil
#   redirect to '/login'
# end
#
# #display the finished_voting page upon clicking the image
# get '/finished_voting' do
#   current_user.votes.create(emoji: params[:emoji_value], leader_id: params[:leader_id])
#   erb :finished_voting
# end
#
#
# #identify the user action for emoji click or vote
# #or upon clicking the image, add values or populate the leader table
# #restrict the user to be able to use the emoji just once or deactivate the emoji once the emoji is clicked
# # post '/all'
# #   if
# #   @leader = Leader.find_by(id: params[:id])
# #   @user = User.find_by(session[:user_id])
# #
# # erb :show
# # end
#                 ####################################
# #Show.erb file
#                 <!-- <div class="emo-page">
#                   <%= @leader.each do |leader| %>
#                   <p>
#                     <% leader.name %>
#                     <% leader.total %>
#                   </p>
#                   <a href="/finished_voting"><img id="h-emo" src="download.jpeg"></a>
#                   <a href="/finished_voting"><img id="a-emo" src="angry-emo.jpeg"></a>
#                 </div> -->
#
#                 <div class="emo-page">
#                   <div class="emo-page-1">
#                     <h2>Hillary Clinton</h2>
#                     <a href="/finished_voting?emoji_value=happy&leader_id=1"><img id="h-emo" src="download.jpeg"></a>
#                     <a href="/finished_voting?emoji_value=angry&leader_id=1"><img id="a-emo" src="angry-emo.jpeg"></a>
#                   </div>
#
#                   <div class="emo-page-2">
#                     <h2>Bernie Sanders</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#                   </div>
#
#                   <div class="emo-page-3">
#                     <h2>Martin O'Malley</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#
#                   </div>
#
#                   <div class="emo-page-4">
#                     <h2>Ben Carson</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#                   </div>
#
#                   <div class="emo-page-5">
#                     <h2>Jed Bush</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#                   </div>
#
#                   <div class="emo-page-6">
#                     <h2>Chris Christie</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#                   </div>
#
#                   <div class="emo-page-7">
#                     <h2>Donald Trump</h2>
#                     <a href="/finished_voting">
#                       <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
#                       <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
#                     </a>
#                   </div>
#
#                 </div>
#############################################################
<!-- <div class="emo-page">
  <div class="emo-page-1">
    <h2>Hillary Clinton</h2>
    <a href="/finished_voting?emoji_value=happy&leader_id=1"><img id="h-emo" src="download.jpeg"></a>
    <a href="/finished_voting?emoji_value=angry&leader_id=1"><img id="a-emo" src="angry-emo.jpeg"></a>
  </div>

  <div class="emo-page-2">
    <h2>Bernie Sanders</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>
  </div>

  <div class="emo-page-3">
    <h2>Martin O'Malley</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>

  </div>

  <div class="emo-page-4">
    <h2>Ben Carson</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>
  </div>

  <div class="emo-page-5">
    <h2>Jed Bush</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>
  </div>

  <div class="emo-page-6">
    <h2>Chris Christie</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>
  </div>

  <div class="emo-page-7">
    <h2>Donald Trump</h2>
    <a href="/finished_voting">
      <img id="h-emo" data-vote="1" src="download.jpeg" alt="" />
      <img id="a-emo" data-vote="-1" src="angry-emo.jpeg" alt="" />
    </a>
  </div> -->

</div>


###################################Javascript#############################
# <script type="text/javascript">
#   $('.disable').click(function(e){
#   e.preventDefault();
# });
# // if already clicked image must be disabled
#
# </script>
