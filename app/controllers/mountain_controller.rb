require './config/environment'

class MountainController < ApplicationController

  get '/mountains' do
    @mountains = Mountain.all
    erb :'/mountains/index'
  end

  get '/mountains/new' do
    if logged_in?
        erb :'/mountains/new'
    else
        redirect '/'
    end
  end

 post '/mountains' do
   if params[:content] == "" || params[:name] == ""
      redirect to "/mountains/new"
   else
      @mountain = Mountain.find_or_create_by(name: params[:name].strip, content: params[:content].strip, user_id: current_user.id)
   if @mountain.save && @mountain.valid?
      redirect to "/mountains/#{@mountain.id}"
   else
      redirect to '/mountains/new'
    end
  end
end

  get '/mountains/:id' do
    @mountain = Mountain.find_by_id(params[:id])
    erb :'/mountains/show'
  end

  get '/mountains/:id/edit' do
      @mountain = Mountain.find_by_id(params[:id])
    if logged_in? && current_user.mountains.include?(@mountain)
      erb :'/mountains/edit'
    else
      redirect to "/mountains/#{@mountain.id}"
    end
  end

  patch '/mountains/:id' do
    if params[:content] == ""
      redirect to "/mountains/#{params[:id]}/edit"
    else
      @mountain = Mountain.find_by_id(params[:id])
      @mountain.name = params[:name]
      @mountain.content = params[:content].strip
   if logged_in? && current_user.mountains.include?(@mountain)
      @mountain.save
      redirect to "/mountains/#{@mountain.id}"
   else
      redirect to "/mountains/new"
   end
  end
 end


delete '/mountains/:id' do
    @mountain = Mountain.find_by_id(params[:id])
  if logged_in? && current_user.mountains.include?(@mountain)
    @mountain.delete
    redirect to '/mountains'
  else
    redirect to "/mountains/#{@mountain.id}"
  end
end



end
