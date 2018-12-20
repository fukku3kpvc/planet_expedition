class Spaceship < ApplicationRecord
  belongs_to :expedition

  validates :velocity, numericality: { greater_than_or_equal_to: 1 }
  validates :title, uniqueness: true, presence: true
end
