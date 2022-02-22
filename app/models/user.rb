class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forests
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  # has_many :reviews #Commented car pas de user_review en place pour l'instant

  # validates :first_name, :last_name, presence: true
  # validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :first_name, :last_name, length: { in: 2..15 }
end
