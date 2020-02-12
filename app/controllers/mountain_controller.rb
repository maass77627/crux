require './config/environment'

class MountainController < Sinatra::Base
  
  get '/mountains' do
    @mountains = Mountain.all
    erb :'/mountains/index' 
  end
  
end 