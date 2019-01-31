require 'test_helper'

class GalaxyVacanciesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get galaxy_vacancies_search_url
    assert_response :success
  end

end
