require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'should log in' do
    expedition = FactoryBot.build(:expedition)
    expedition.save
    view_sign_in(:user)

    assert_text 'Expeditions List'

    visit spaceships_path

    click_on 'Create'
    click_on 'Create New Spaceship'

    fill_in 'Title', with: 'Linkor'
    fill_in 'Velocity', with: 1000
    find('#spaceship_expedition_id').find("option[value='#{expedition.id}']").select_option

    click_on 'Create Spaceship'

    assert_text 'Linkor'
  end
end
