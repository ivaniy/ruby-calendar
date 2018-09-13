class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.date :date
      t.time :start_at
      t.time :end_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
