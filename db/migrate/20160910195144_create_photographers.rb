class CreatePhotographers < ActiveRecord::Migration[5.0]
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :category

      t.timestamps
    end
  end
end
