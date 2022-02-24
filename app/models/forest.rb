class Forest < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [
      [:address, 'A'],
      [:title, 'B'],
      [:description, 'C'],
      [:tree, 'D'],
      [:animals, 'D']
    ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :forest_reviews, dependent: :destroy
  has_many_attached :photos

  ANIMALS = %w(Lizards Toucans Kittens Rabbits Boars)
  TREES = %w(Mahagony Plywood Birch Pine)

  validates :title, :description, :address, :tree, :animals, :price, :size, presence: true
  validates :title, length: { in: 6..150 }
  validates :title, uniqueness: true
  validates :description, :address, length: { in: 6..600 }
  validates :price, numericality: { in: 15..250 }
  validates :size, numericality: { only_integer: true }
  validates :animals, presence: true, inclusion: { in: ANIMALS }
  validates :tree, presence: true, inclusion: { in: TREES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # add inclusion to tree and animals
end
