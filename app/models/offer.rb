class Offer < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def rating
    reviews = self.reviews
    total = reviews.inject(0) { |sum, review| sum + review[:rating] }
    avg = total.fdiv(reviews.count).round(2)
    avg.nan? ? 'none' : avg
  end

end
