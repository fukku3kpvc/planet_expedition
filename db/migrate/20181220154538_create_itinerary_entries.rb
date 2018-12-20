class CreateItineraryEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_entries do |t|
      t.belongs_to :itineraries, index: true
      t.belongs_to :planets, index: true
      t.integer :value, default: 1, null: false, unique: true

      t.timestamps
    end
  end
end
