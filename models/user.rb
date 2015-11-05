class User < ActiveRecord::Base
  has_many :votes
  has_secure_password  #gives us the password method, authenticate the method
end
