class User < ApplicationRecord
  has_many :events_users, inverse_of: :event
  has_many :events, through: :events_users

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { maximum: 100 }, format: { with: /\A[a-zA-Z]+\z/ }, on: :update
end
