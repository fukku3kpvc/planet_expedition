require "application_system_test_case"

class GalaxiesCreateFlowsTest < ApplicationSystemTestCase
  test 'create itinerary_entry' do
    visit new_itinerary_entry_url
    fill_in 'Value', with: 100
    find(:select, ':planet').first(:option, 'Mars').select_option
    select 'Mars Expedition', from: 'Itinerary'
    click_on 'Create Itinerary entry'

    assert_text 'Itinerary Entries'
  end
end
