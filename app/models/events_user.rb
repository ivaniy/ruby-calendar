class EventsUser < ApplicationRecord
  belongs_to :event, inverse_of: :events_users
  belongs_to :user, inverse_of: :events_users

  enum user_role: [:creator, :participant, :guest]
end
