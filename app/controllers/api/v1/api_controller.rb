module Api::V1
  class ApiController < Api::ApiController
    def index
      render json: ::V1::ExpeditionSerializer.new(Expedition.all).serialized_json
    end
  end
end