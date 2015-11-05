class Leader < ActiveRecord::Base
  has_many :votes
  # has_many_through :users

end
