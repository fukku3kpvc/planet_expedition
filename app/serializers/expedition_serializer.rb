class ExpeditionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title

  attribute :distance do |object|
    object.itinerary.distance
  end

  has_many :spaceships
end
