class Exchange < ApplicationRecord
  validate :matching_date_cannot_be_greater_than_gifting_date
  has_many :members, dependent: :destroy

  def matching_date_cannot_be_greater_than_gifting_date
    if date_of_matching > date_of_gifting
      errors.add(:date_of_matching, "can't be after gifting date")
    end
  end
end
