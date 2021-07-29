class Mountain < ActiveRecord::Base
  belongs_to :user

    attr_accessor :img_url, :name, :address
  
    def initialize(img_url, name, address)
      @img_url = img_url
      @name = name
      @address = address
  end
end