module Api::V2
  class ApiController < Api::ApiController

    protected

    # skip_before_action :verify_authenticity_token

    private

    def expedition_params
      params.permit(:title, :description)
    end
  end
end