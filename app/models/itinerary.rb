class Itinerary < ApplicationRecord
  belongs_to :expedition

  has_many :itinerary_entries
  has_many :planets, :through => :itinerary_entries

  def distance_length
    self[:distance].to_f > 0 ? self[:distance].to_f : planets.sum(:distance)
  end
end
