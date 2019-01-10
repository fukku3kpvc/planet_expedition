require 'test_helper'

class SpaceshipControllerTest < ActionDispatch::IntegrationTest

  def create_expedition
    expedition = Expedition.new(title: 'First Expedition',
                                description: 'This is a first expedition')
    expedition.save
  end

  test 'should create spaceship' do
    create_expedition
    sign_in(:user)
    post spaceships_path, params: { spaceship: attributes_for(:spaceship) }
    assert_redirected_to spaceships_path
  end

  test 'should update spaceship' do
    create_expedition
    sign_in(:user)
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
    create_expedition
    sign_in(:user)
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
    create_expedition
    sign_in(:user)
    spaceship = FactoryBot.build(:spaceship)
    spaceship.save
    assert_difference('Spaceship.count', -1) do
      delete spaceship_url(spaceship)
    end

    assert_redirected_to spaceships_path
  end

  test 'should log in and create spaceship' do
    create_expedition
    sign_in(:user)
    # assert_redirected_to expeditions_path
    post spaceships_path, params: { spaceship: attributes_for(:spaceship) }
    assert_redirected_to spaceships_path
  end
end
