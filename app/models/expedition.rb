class Expedition < ApplicationRecord
  has_one :itinerary, dependent: :destroy
  has_many :spaceships

  validates :title, :description, presence: true
  validates :title, length: { in: 5..50 }
  validates :description, length: { in: 10..500 }

  after_create :create_assocs

  private

  def create_assocs
    create_itinerary(distance: 0.0)
  end
end
