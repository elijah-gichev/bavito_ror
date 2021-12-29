class StatusValidator < ActiveModel::Validator
  def StatusValidate(record)
    if record.status != "DELETED" or record.status != "EXCHANGED" or record.status != "DEFAULT"
      record.errors.add :base, "Incorrect status"
    end
  end
end

class Request < ApplicationRecord
  validates_with StatusValidator
  belongs_to :user, foreign_key: 'creator_id'
  validates :comment, :status, presence: true

end

