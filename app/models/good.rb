class Good < ApplicationRecord
  validates  :name, :description, :image_url, :title, presence: true
  belongs_to :user
end
