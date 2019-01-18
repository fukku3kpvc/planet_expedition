module Api::V2
  class SpaceshipsController < ApiController
    def show
      if Spaceship.where(id: params[:id]).exists?
        render json: ::V2::SpaceshipSerializer.new(Spaceship.find params[:id]).serialized_json
      else
        render json: 'not found'
      end
    end
  end
end