FactoryBot.define do
  factory :spaceship do
    title { 'Proton-M' }
    velocity { 460 }
    expedition_id { Expedition.first.id }
  end
end
