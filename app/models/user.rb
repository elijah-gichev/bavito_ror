class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :name
  has_many :good
  has_many :request
  has_secure_password
end
