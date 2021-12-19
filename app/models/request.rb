class Request < ApplicationRecord
  has_many :goods
  has_many :users

end
