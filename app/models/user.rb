class User < ActiveRecord::Base

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  has_many :mountains

  has_secure_password

#  def authenticate(password)
#   if self.password == password
#     self
#   else
#     false
  # end
 #end



end
