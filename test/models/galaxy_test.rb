require 'test_helper'

class GalaxyTest < ActiveSupport::TestCase
  test 'should create galaxy' do
    galaxy = Galaxy.new(title: 'Milky Way')
    assert galaxy.save
  end

  test 'should not create galaxy' do
    galaxy_empty = Galaxy.new(title: '')
    galaxy_length = build(:galaxy)

    assert_not galaxy_empty.save
    assert_not galaxy_length.save
  end
end
