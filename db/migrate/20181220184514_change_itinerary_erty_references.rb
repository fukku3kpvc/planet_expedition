class ChangeItineraryErtyReferences < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:itinerary_entries, :itineraries)
    remove_reference(:itinerary_entries, :planets)
  end
end
