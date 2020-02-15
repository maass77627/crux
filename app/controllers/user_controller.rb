require './config/environment'

class UserController < ApplicationController

#purpose of route is to render the login page/form
get '/login' do
  erb :login

end

get '/signup' do

end

post '/login' do 
  
end 

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

end
