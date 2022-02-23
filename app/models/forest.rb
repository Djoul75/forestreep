class Forest < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :forest_reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, :description, :address, :tree, :animals, :price, :size, presence: true
  validates :title, length: { in: 6..150 }
  validates :title, uniqueness: true
  validates :description, :address, length: { in: 6..600 }
  validates :price, numericality: { in: 15..250 }
  validates :size, numericality: { only_integer: true }

  # add inclusion to tree and animals
end
