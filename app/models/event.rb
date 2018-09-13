class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { in: 1..30 }
  validates :description, length: { maximum: 500 }
  validates :location, length: { maximum: 100 }
  validates :date, presence: true
  validate :end_must_be_after_start
  
  private

  def end_must_be_after_start
    if end_at < start_at
      errors.add(:end_at, 'must be after start time')
    end
  end
end
