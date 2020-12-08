class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_one :review

  # validate :date_cannot_be_in_the_past
  validate :final_date_greater_or_equal_to_begin_date
  validates :begin_date, presence: true
  validates :final_date, presence: true

  private

  def date_cannot_be_in_the_past
    errors.add(:begin_date, "can't be in the past") if begin_date.present? && begin_date < Date.today
    errors.add(:final_date, "can't be in the past") if final_date.present? && final_date < Date.today
  end

  def final_date_greater_or_equal_to_begin_date
    if final_date.present? && final_date < begin_date
      errors.add(:final_date, "final date must be greater or equal to begin date")
    end
  end
end
