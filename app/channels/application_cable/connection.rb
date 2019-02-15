module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = find_auth_user
    end

    private

    def find_auth_user
      if auth_user = env['warden'].user
        auth_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
