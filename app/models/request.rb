class Request < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  validates :comment, :status, presence: true

  validate :status, unless: Proc.new {
    |a| a == "DELETED" || a == "EXCHANGED" || a == "DEFAULT"
  }


  private
  def validated_status?

  end
end
