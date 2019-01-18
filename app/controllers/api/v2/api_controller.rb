module Api::V2
  class ApiController < Api::ApiController

    protected

    skip_before_action :verify_authenticity_token


    def index
      render json: ::V2::SpaceshipSerializer.new(Spaceship.all).serialized_json
    end

    def show
      # if Spaceship.where(id: params[:id]).exists?
      #   render json: ::V2::SpaceshipSerializer.new(Spaceship.find params[:id]).serialized_json
      # else
      #   render json: 'not found'
      # end
    end

    def update
      # expedition = Expedition.find params[:id]
      # if expedition.update(expedition_params)
      #   render json: expedition, status: :ok
      # else
      #   render json: { errors: expedition.errors }, status: :unprocessable_entity
      # end
    end

    def destroy

    end

    private

    def expedition_params
      params.permit(:title, :description)
    end
  end
end