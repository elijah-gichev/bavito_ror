class User < ApplicationRecord
  validates :email,  :phone, presence: true, uniqueness: true
  validates_presence_of :name
  has_many :products
  has_many :request

  validates_format_of :phone, with: /[0-9]{11}/

  has_secure_password


  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
