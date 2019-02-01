require 'test_helper'

class GalaxyVacansiesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get galaxy_vacansies_search_url
    assert_response :success
  end

end
