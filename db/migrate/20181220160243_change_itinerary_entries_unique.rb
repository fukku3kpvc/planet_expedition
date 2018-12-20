class ChangeItineraryEntriesUnique < ActiveRecord::Migration[5.2]
  def change
    change_column(:itinerary_entries, :value, :integer, :unique => true)
  end
end
