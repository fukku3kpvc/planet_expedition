require 'test_helper'

class GalaxiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get galaxies_new_url
    assert_response :success
  end

  test "should get create" do
    get galaxies_create_url
    assert_response :success
  end

  test "should get index" do
    get galaxies_index_url
    assert_response :success
  end

end
