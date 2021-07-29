require 'net/http'
require 'open-uri'
require 'json'

class GetMountains

   URL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=mountains+in+United+States&key=%20AIzaSyA3MMJZakFzMKdABH1GBP6XzJrbApF7o7s'

   def get_mountains
      uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
   end 

   def mountains_photo
      mountains = JSON.parse(self.get_mountains)
     # puts mountains["results"][0]["photos"][0]["photo_reference"]
      #puts mountains["results"][0]["photo_reference"]
       mountains["results"].each do |mountain|
         Mountain.create(name: mountain["name"], img_url: mountain["photos"], address: ["formatted_address"])
   end 
   # end
end 

# mountains = GetMountains.new.get_mountains
# puts mountains

mountains = GetMountains.new
puts mountains.mountains_photo











# require 'rubygems'
# require 'httparty'

# class MountainResty 
    

# url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=mountains+in+United+States&key=%20AIzaSyA3MMJZakFzMKdABH1GBP6XzJrbApF7o7s'
# response = HTTParty.get(url)

#  puts response
# include HTTParty
# base_uri "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

# def posts
#     self.class.get('mountains+in+United+States&key=%20AIzaSyA3MMJZakFzMKdABH1GBP6XzJrbApF7o7s')
# end 
# end

# mountain_resty = MountainResty.new

#  puts mountain_resty.posts

#  mountain_resty.posts.each do |post|
#      puts post[1][0]
   # end 

   