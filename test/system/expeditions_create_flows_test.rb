require "application_system_test_case"

class ExpeditionsCreateFlowsTest < ApplicationSystemTestCase
  test 'should create spaceship' do
    visit new_expedition_url
    fill_in "Title", with: 'New Title'
    fill_in "Description", with: 'Basic Description'
    click_on 'Create Expedition'

    assert_text 'New Title'
  end
end
