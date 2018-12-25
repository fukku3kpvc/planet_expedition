require 'test_helper'

class GalaxiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get galaxies_url

    assert_response :success
  end

  test 'should create galaxy' do
    post galaxies_path, params: { galaxy: { title: 'Sample Galaxy' } }

    assert_redirected_to galaxies_path
    assert_not_equal 'Во время сохранения произошли ошибки', flash[:alert]
  end

  test 'should not create galaxy' do
    post galaxies_path, params: { galaxy: { title: '' } }

    assert_equal 'Во время сохранения произошли ошибки', flash[:alert]
  end

  test 'should update galaxy' do
    galaxy = Galaxy.new(title: 'Sample Galaxy')
    galaxy.save
    patch galaxy_url(galaxy), params: { galaxy: { title: 'Galaxy Union' } }

    assert_redirected_to galaxy_path(galaxy)
    galaxy.reload
    assert_equal 'Galaxy Union', galaxy.title
  end

  test 'should not update galaxy' do
    galaxy = Galaxy.new(title: 'Sample Galaxy')
    galaxy.save
    patch galaxy_url(galaxy), params: { galaxy: { title: '' } }

    assert_equal 'Errors appeared while saving', flash[:alert]
  end

  test 'should destroy galaxy' do
    galaxy = Galaxy.new(title: 'Sample Galaxy')
    galaxy.save

    assert_difference('Galaxy.count', -1) do
      delete galaxy_url(galaxy)
    end

    assert_redirected_to galaxies_path
    assert_equal 'Destroyed successfully', flash[:notice]
  end

end
