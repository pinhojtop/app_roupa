class Offer < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  has_one_attached :photo

  def rating
    unless self.reviews.nil?
      total = self.reviews.inject(0) { |sum, review| sum + review[:rating] }
      avg = total.fdiv(reviews.count).round(2)
      avg.nan? ? 'none' : avg
    end
  end

  def reviews
    rents = self.rents
    reviews = []
    rents.each do |rent|
      reviews << rent.review unless rent.review.nil?
    end
    return reviews
  end
end

# <%= link_to 'Avalie', new_offer_review_path(@offer) %>
# <div class="mx-2">
#             <%= link_to 'Apagar', review_path(review), method: :delete, data: { confirm: 'Tem certeza de que deseja apagar a avaliação?' } %>
#           </div>
