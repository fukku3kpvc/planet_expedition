require 'test_helper'

class ExpeditionTest < ActiveSupport::TestCase
  test "should save valid expedition and create association Itinerary" do
    expedition = build(:expedition)
    assert expedition.save
    puts "expedition_id: #{expedition.id}"
    Itinerary.all.each do |itinerary|
      puts "itinerary_id: #{itinerary.id},
            itinerary_exp_id: #{itinerary.expedition_id},
            itinerary_dist: #{itinerary.distance}"
    end
  end

  test "should not save invalid expedition" do
    expedition = Expedition.new
    assert_not expedition.save
  end

  test "should not save empty title" do
    expedition = Expedition.new
    assert_not expedition.save
  end

  test "should not save 51 length title" do
    expedition = Expedition.new(title: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
                                description: 'This is a description')
    assert_not expedition.save
  end

  test "should save 50 length title" do
    assert Expedition.new(title: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
                          description: 'This is a description')
  end
end
