class ChatsController < ApplicationController
  after_action :send_message, only: :new_message
  def index; end

  def new_message
    @message = params[:message_input]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def send_message
    ActionCable.server.broadcast ChatsChannel::TITLE,
                                 action: :new_message.to_s,
                                 message: @message,
                                 user: current_user.email
  end
end
