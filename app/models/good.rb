class Good < ApplicationRecord
  validates_presence_of :name, :description, :image_url
  belongs_to :user
end
