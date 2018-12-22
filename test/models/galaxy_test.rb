require 'test_helper'

class GalaxyTest < ActiveSupport::TestCase
  test 'should create galaxy' do
    assert Galaxy.new(title: 'Milky Way').save
  end
end
