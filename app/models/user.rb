class User < ApplicationRecord
  has_many :events_users
  has_many :events, through: :events_users

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { in: 2..50 }, format: { with: /\A[a-zA-Z]+\z/ }, on: :update
end
