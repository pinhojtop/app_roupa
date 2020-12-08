class Review < ApplicationRecord
  belongs_to :rent

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: (0..5) }
  validates :rent_id, uniqueness: true
end
