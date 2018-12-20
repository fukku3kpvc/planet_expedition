class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.float :distance, null: false

      t.timestamps
    end
  end
end
