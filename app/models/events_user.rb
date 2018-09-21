class EventsUser < ApplicationRecord
  before_create :set_user_role

  belongs_to :event
  belongs_to :user
  
  enum user_role: [:creator, :participant, :guest]

  def set_user_role
    write_attribute('user_role', 1) if event.participants.include?(user)
    write_attribute('user_role', 2) if event.guests.include?(user)
  end
end
