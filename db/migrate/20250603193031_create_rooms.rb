class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price_per_night
      t.text :description
      t.integer :max_guests

      t.timestamps
    end
  end
end
