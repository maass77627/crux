# require 'rest-client'


# def mountains
  
  
#   response = RestClient.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query=mountains+in+United+States&key=%20AIzaSyA3MMJZakFzMKdABH1GBP6XzJrbApF7o7s')

#   json = JSON.parse response
  
#   if !json.nil?
#       json["data"]["results"].map do |mountain|
#           Mountain.create(
#               name: "#{name}",
#               address: "#{formatted_address}",
#               img_url: "#{photo_reference}",
#           )
#       end
#   else
#       puts "Error seeding mountains."
#   end

# end











User.create(username: "chester", password: "password")
User.create(username: "Sophie", password: "password")
Mountain.create(name: "Elbert", content: "Colorado", img_url: "wfwefff", address: "colorado")
Mountain.create(name: "Subert", content: "Colorado", img_url: "3f3f3f", address: "colorado")
