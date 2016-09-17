class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :user_id
      t.integer :photographer_id
      t.date :date
      t.time :time
      t.string :comment

      t.timestamps
    end
  end
end
