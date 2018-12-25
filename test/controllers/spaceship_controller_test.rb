require 'test_helper'

class SpaceshipControllerTest < ActionDispatch::IntegrationTest
  test 'should create spaceship' do
    post spaceships_path, params: { spaceship: attributes_for(:spaceship) }
    assert_redirected_to spaceships_path
  end

  test 'should update spaceship' do
    spaceship = Spaceship.new(title: 'TestTitle',
                              velocity: 250,
                              expedition_id: Expedition.first.id)
    spaceship.save

    patch spaceship_url(spaceship),
          params: { spaceship: attributes_for(:spaceship) }

    assert_redirected_to spaceships_path
    spaceship.reload
    assert_equal 'Proton-M', spaceship.title
  end

  test 'should not save spaceship' do
    spaceship = Spaceship.new(title: 'TestTitle',
                              velocity: 250,
                              expedition_id: Expedition.first.id)
    spaceship.save

    patch spaceship_url(spaceship),
          params: { spaceship: { title: '',
                                 velocity: 10000,
                                 expedition_id: Expedition.first.id } }

    spaceship.reload
    assert_equal 'TestTitle', spaceship.title
  end

  test 'should destroy spaceship' do
    spaceship = FactoryBot.build(:spaceship)
    spaceship.save
    assert_difference('Spaceship.count', -1) do
      delete spaceship_url(spaceship)
    end

    assert_redirected_to spaceships_path
  end

  # test 'should not destroy spaceship' do
  #   spaceship = FactoryBot.build(:spaceship)
  #   spaceship.save
  # end
end
