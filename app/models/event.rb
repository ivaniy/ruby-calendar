class Event < ApplicationRecord
  has_many :events_users
  has_many :users, through: :events_users
  has_many :participants, -> { joins(:events_users).where('events_users.user_role = ?', 1) }, through: :events_users, source: :user
  has_many :guests, -> { joins(:events_users).where('events_users.user_role = ?', 2) }, through: :events_users, source: :user

  validates :name, presence: true, length: { in: 1..30 }
  validates :description, length: { maximum: 500 }
  validates :location, length: { maximum: 100 }
  validates :date, :start_event, :end_event, presence: true
  validate :start_end_times

  private

  def start_end_times
    errors.add(:end_event, 'must be after start time') if end_event < start_event
  end
end
