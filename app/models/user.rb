class User < ActiveRecord::Base
  has_many :mountains 
  
  has_secure_password
  
 
  
end