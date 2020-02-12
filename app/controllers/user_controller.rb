require './config/environment'

class UserController < Sinatra::Base
  
  get '/users' do
    @users = User.all
    erb :'/users/index' 
  end
  
end 