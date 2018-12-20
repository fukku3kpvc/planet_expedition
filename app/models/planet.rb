class Planet < ApplicationRecord
  has_many :itinerary_entries
  has_many :itineraries, :through => :itinerary_entries

  validates :title, :description, :galaxy, :distance, presence: true
  validates :title, length: { maximum: 15 }
  validates :galaxy, length: { maximum: 20 }
  validates :description, length: { in: 10..500 }
  validates :distance, numericality: { greater_than_or_equal_to: 0 }

  scope :accessible, -> { where(available: true) }
end
