module Api
  class ApiController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    include ActiveRecord::SecureToken::ClassMethods

    protected
    skip_before_action :authenticate_user!
    before_action :login_auth

    private

    def rest_auth
      result = authenticate_with_http_token do |token|
        User.find_by(auth_token: token).present?
      end
      render json: { error: 'Invalid token!' }, status: 403 unless result
    end

    def login_auth
      result = authenticate_with_http_basic do |email, password|
        user = User.find_by(email: email)
        user&.valid_password?(password)
      end
      render json: { error: 'Invalid email/password' }, status: 403 unless result
    end
  end
end