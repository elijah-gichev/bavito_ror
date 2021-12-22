class Request < ApplicationRecord
  belongs_to :user
  validates :comment, :status, presence: true
end
