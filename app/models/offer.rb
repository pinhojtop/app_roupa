class Offer < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  has_one_attached :photo

  # def rating
  #   reviews = self.rents.reviews
  #   total = reviews.inject(0) { |sum, review| sum + review[:rating] }
  #   avg = total.fdiv(reviews.count).round(2)
  #   avg.nan? ? 'none' : avg
  # end
end
