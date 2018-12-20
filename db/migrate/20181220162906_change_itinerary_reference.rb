class ChangeItineraryReference < ActiveRecord::Migration[5.2]
  def change
    remove_column(:itineraries, :expeditions_type)
    change_table :itineraries do |t|
      t.belongs_to :expedition, foreign_key: true, index: { unique: true }
    end
    change_column_null(:itineraries, :distance, true)
  end
end
