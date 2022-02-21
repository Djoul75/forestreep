class ForestReview < ApplicationRecord
  belongs_to :user
  belongs_to :forest

  validates :comment, :rating, presence: true
  validates :comment, length: { in: 6..150 }
  validates :rating, numericality: { in: 1..5 }
end
