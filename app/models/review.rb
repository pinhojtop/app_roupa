class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rent

  validates :content, :rating, presence: true
end
