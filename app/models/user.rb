class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :goods
  has_many :requests
end
