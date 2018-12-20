class ChangeItinerary < ActiveRecord::Migration[5.2]
  def change
    remove_belongs_to(:itineraries, :expeditions)
  end
end
