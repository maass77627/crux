require './config/environment'

class UserController < ApplicationController

  get "/signup" do
		erb :signup
	end

	post "/signup" do
  user = User.new(:username => params[:username], :password => params[:password])

  if user.save
    redirect "/login"
  else
    redirect "/failure"
  end
end


	get "/login" do
		erb :login
	end

	post "/login" do
		user = User.find_by(:username => params[:username])

		  if user && user.authenticate(params[:password])
		    session[:user_id] = user.id
		    #redirect "/success"
		  else
		    #redirect "/failure"
		  end
	end


	get "/logout" do
		session.clear
		redirect "/"
	end
	
	get '/users/:id' do 
	  @user = User.find_by(id: params[:id])
	  erb :'/users/show' 
	  
	end 
	
	end 
	
#	get "/success" do
	#	if logged_in?
		#	erb :success
	#	else
		#	redirect "/login"
	#	end
#	end

#	get "/failure" do
	#	erb :failure
	#end
	#creating a session or adding key value pair to session hash 
#recieve the login form, find the user and log the user in
