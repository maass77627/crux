require './config/environment'

class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :'users/signup'
    end
  end

  get '/login' do
	    if logged_in?
	      redirect to "/users/#{current_user.id}"
	    else
	      erb :'users/login'
	    end
	  end

  post '/login' do
	      @user = User.find_by(username: params[:username].strip)

	    if !@user.nil? && @user.authenticate(params[:password])
	      session[:user_id] = @user.id
	      redirect to "/users/#{@user.id}"
	    else
	      redirect to '/login'
	    end
	  end

	  post '/signup' do
     if User.find_by(username: params[:username]) == nil && params[:username] != "" && params[:password] != ""
       @user = User.create(username: params[:username], password: params[:password])
	      session[:user_id] = @user.id
	      redirect to "/users/#{@user.id}"
      else
        redirect to '/users/signup'
	    end
	  end


    get '/users/:id' do
	       @user = User.find_by_id(params[:id])
	    if logged_in? && @user == current_user
	      erb :'users/show'
	    else
	      redirect to '/login'
	    end
	  end


	  get '/users/:id/edit' do
	       @user = User.find_by_id(params[:id])
	    if logged_in? && @user == current_user
	      erb :'users/edit'
	    else
	      redirect to '/login'
	    end
	  end


	  patch '/users/:id' do
	      @user = User.find_by_id(params[:id])
	      @user.username = params[:username].strip
	      @user.password = params[:password].strip
	    if logged_in? && @user == current_user && @user.valid?
	      @user.save
	      redirect to "/users/#{@user.id}"
	    else
	      redirect to '/login'
	    end
	  end


	  get '/logout' do
	   if logged_in?
	     session.clear
	     redirect to '/'
	   else
	     redirect to '/'
	   end
	 end


	 delete '/users/:id' do
	      @user = User.find_by_id(params[:id])
	    if logged_in? && @user == current_user
	      @user.mountains.each do |mountain|
	        mountain.delete
	      end
	      @user.delete
	      session.clear
	      redirect to '/'
	    else
	      redirect to '/login'
	    end
	 end


	end
