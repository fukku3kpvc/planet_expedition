require "application_system_test_case"

class GalaxiesCreateFlowsTest < ApplicationSystemTestCase
  test 'create galaxies' do
    visit new_galaxy_url
    fill_in 'Title', with: 'Milky Way'
    click_on 'Create Galaxy'

    assert_text 'Milky Way'
  end
end
