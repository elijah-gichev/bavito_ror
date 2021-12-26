class Good < ApplicationRecord
  validates_presence_of :title, :description, :image_url, :points

  belongs_to :user
end
