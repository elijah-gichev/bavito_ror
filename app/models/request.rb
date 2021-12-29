class StatusValidator < ActiveModel::Validator
  def validate(record)
    if record.status != "DELETED" and record.status != "EXCHANGED" and record.status != "DEFAULT"
      record.errors.add :base, "Incorrect status"
    end
  end
end

class IDsValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :base, "User IDs match"  if record.sender_id == record.recipient_id
    record.errors.add :base, "Products IDs match"  if record.sender_good_id == record.recipient_good_id
  end
end


class Request < ApplicationRecord
  validates_with StatusValidator, IDsValidator
  belongs_to :user, foreign_key: 'creator_id'
  validates :comment, :status, presence: true

end

