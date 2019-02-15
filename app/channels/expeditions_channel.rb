class ExpeditionsChannel < ApplicationCable::Channel
  TITLE = 'ExpeditionsChannel'

  def subscribed
    # stream_from "some_channel"
    stream_from 'ExpeditionsChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end
end
