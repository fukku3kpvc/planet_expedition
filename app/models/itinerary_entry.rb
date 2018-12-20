class ItineraryEntry < ApplicationRecord
  belongs_to :itinerary
  belongs_to :planet
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1 }, uniqueness: true
end
