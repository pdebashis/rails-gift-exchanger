class Exchange < ApplicationRecord
  validate :matching_date_cannot_be_greater_than_gifting_date, :finish_date_cannot_be_less_than_gifting_date
  has_many :members, dependent: :destroy

  def matching_date_cannot_be_greater_than_gifting_date
    if date_of_matching > date_of_gifting
      errors.add(:date_of_matching, "can't be after gifting date")
    end
  end

  def finish_date_cannot_be_less_than_gifting_date
    if finish_date < date_of_gifting
      errors.add(:finish_date, "can't be before gifting date")
    end
  end
end
