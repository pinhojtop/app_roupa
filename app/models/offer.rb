class Offer < ApplicationRecord
  belongs_to :user
  has_many :rent
  has_many :review
end
