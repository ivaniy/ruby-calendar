class CreateEventsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :events_users do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.integer :user_role
      t.string :state
    end
  end
end
