require "application_system_test_case"

class ExpeditionsCreateFlowsTest < ApplicationSystemTestCase
  test 'should edit expedition' do
    expedition = FactoryBot.build(:expedition)
    expedition.save
    visit expedition_path(expedition)
    click_on 'Edit Expedition'
    fill_in 'Title', with: 'Mily Way II'
    fill_in 'Description', with: 'This is new important'
    click_on 'Update Expedition'

    assert_text 'Expeditions List'
  end

  test 'should not edit expedition' do
    expedition = FactoryBot.build(:expedition)
    expedition.save
    visit expedition_path(expedition)
    click_on 'Edit Expedition'
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    click_on 'Update Expedition'

    assert_text "Title can't be blank"
    assert_text "Description can't be blank"
  end
end