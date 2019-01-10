ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  include FactoryBot::Syntax::Methods

  # Add more helper methods to be used by all tests here...
  def sign_in(role)
    post user_session_path, params: { user: attributes_for(role) }
  end

  def view_sign_in(role)
    user = create(role)

    visit galaxies_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'
  end
end
