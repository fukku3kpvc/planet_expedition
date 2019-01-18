module Api::V2
  class ExpeditionsController < ApiController
    before_action :set_expedition, only: %I[show update destroy]

    def show
      render json: ::V2::ExpeditionSerializer.new(Expedition.find params[:id]).serialized_json
    end

    def update
      if @expedition.update(expedition_params)
        render json: @expedition, status: :ok
      else
        render json: { errors: @expedition.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @expedition.destroy
      if @expedition.destroyed?
        render json: 'delete successfully'
      else
        render json: 'delete aborted'
      end
    end

    private

    def set_expedition
      if Expedition.where(id: params[:id]).exists?
        @expedition = Expedition.find params[:id]
      else
        render json: 'expedition not exist!'
      end
    end
  end
end