class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :goods
  has_many :requests
  has_secure_password
end
