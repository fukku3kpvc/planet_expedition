module Api::V2
  class SessionsController < ApiController
    skip_before_action :login_auth
    def new
      result = authenticate_with_http_basic do |email, password|
        user = User.find_by(email: email)
        user&.valid_password?(password)
        render json: generate_unique_secure_token
      end
      render json: { error: 'Invalid email/password' }, status: 403 unless result
    end
  end
end