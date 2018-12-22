require "application_system_test_case"

class ExpeditionsCreateFlowsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit expeditions_create_flows_url
  #
  #   assert_selector "h1", text: "ExpeditionsCreateFlow"
  # end
  test 'should create spaceship' do
    visit new_spaceship_url
    click_on 'Create New Spaceship'
    fill_in "Title", with: 'New Title'
    fill_in "Velocity", with: "300"
    click
    click_on "Expedition *"
    click_on 'Save Spaceship'

    assert_text 'New Title'

  end
end
