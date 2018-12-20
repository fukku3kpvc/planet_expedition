class AddItineraryRefToExpedition < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to(:itineraries, :expeditions, polymorphic: true)
  end
end
