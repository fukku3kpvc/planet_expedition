class AddReferenceToItineraryEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :itinerary_entries do |t|
      t.belongs_to :planet, foreign_key: true
      t.belongs_to :itinerary, foreign_key: true
    end

    add_index :itinerary_entries, [:value, :itinerary_id], unique: true
    add_index :itinerary_entries, [:itinerary_id, :planet_id], unique: true, name: 'itinerary_planet_ids_unique'
  end
end
