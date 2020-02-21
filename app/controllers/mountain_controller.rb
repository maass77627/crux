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
  @mountain = Mountain.create(:name => params[:name], :content => params[:content])
  redirect to "/mountains/#{@mountain.id}"
end

get '/mountains/:id' do
  @mountain = Mountain.find_by_id(params[:id])
  erb :'/mountains/show'
end

get '/mountains/:id/edit' do  #load edit form
    @mountain = Mountain.find_by_id(params[:id])
    erb :'/mountains/edit'
  end

patch '/mountains/:id' do #edit action
  @mountain = Mountain.find_by_id(params[:id])
  @mountain.name = params[:name]
  @mountain.content = params[:content]
  @mountain.save
  redirect to "/mountains/#{@mountain.id}"
end

delete '/mountains/:id' do #delete action
  @mountain = Mountain.find_by_id(params[:id])
  @mountain.delete
  redirect to '/mountains'
end

end
