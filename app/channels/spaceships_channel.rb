class SpaceshipsChannel < ApplicationCable::Channel
  TITLE = 'SpaceshipsChannel'

  def subscribed
    # stream_from "some_channel"
    stream_from 'SpaceshipsChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
