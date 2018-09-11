class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { in: 2..50 }, format: { with: /\A[a-zA-Z]+\z/ } 
end
