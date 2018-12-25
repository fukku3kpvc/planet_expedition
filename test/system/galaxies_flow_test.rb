require "application_system_test_case"

class GalaxiesCreateFlowsTest < ApplicationSystemTestCase
  def create_galaxy
    visit galaxies_path
    click_on 'Create Galaxy'
    fill_in 'Title', with: 'Milky Way'
    click_on 'Create Galaxy'
  end

  test 'should create galaxy' do
    visit galaxies_path
    click_on 'Create Galaxy'
    fill_in 'Title', with: 'Milky Way'
    click_on 'Create Galaxy'

    assert_text 'Galaxies List'
  end

  test 'should not create galaxy' do
    visit galaxies_path
    click_on 'Create Galaxy'
    fill_in 'Title', with: ''
    click_on 'Create Galaxy'

    assert_text "Title can't be blank"
  end

  test 'should get index' do
    visit galaxies_path

    assert_text 'Galaxies List'
  end

  test 'should update galaxy' do
    create_galaxy
    click_on 'Show'
    click_on 'Edit'
    fill_in 'Title', with: "Milky Way II"
    click_on 'Update Galaxy'

    assert_text "Galaxy Milky Way II"
  end

  test 'should not update galaxy' do
    create_galaxy
    click_on 'Show'
    click_on 'Edit'
    fill_in 'Title', with: ''
    click_on 'Update Galaxy'

    assert_text "Title can't be blank"
  end

  # test 'should destroy galaxy' do
  #   create_galaxy
  #   click_on 'Show'
  #   click_on 'Delete'
  #   accept_confirm do
  #     click_on 'OK'
  #   end
  #
  #   assert_text 'Galaxies List'
  # end
end