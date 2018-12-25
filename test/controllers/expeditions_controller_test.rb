require 'test_helper'

class ExpeditionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get expeditions_url
    assert_response :success
  end

  test 'should post create' do
    post expeditions_path, params: { expedition: attributes_for(:expedition) }
    assert_redirected_to expeditions_path
  end

  test 'should post create new expedition' do
    assert_difference "Expedition.count", 1 do
      post expeditions_path, params: { expedition: attributes_for(:expedition) }
    end
    # flash[:alert]
  end

  test 'create expedition with planets' do
    post expeditions_path, params: { expedition: attributes_for(:expedition) }
    # post planets_path, params: { planet: { title: 'Planet1',
    #                                       galaxy: 'Milky Way',
    #                                       description: 'Planet in Solar System',
    #                                       distance: 800.0 } }
    # post itinerary_entries_path, params: { itinerary_entry: {value: 100,
    #                                                        planet_id: 1,
    #                                                        itinerary_id: 1 } }

    assert_redirected_to expeditions_path
  end
end
