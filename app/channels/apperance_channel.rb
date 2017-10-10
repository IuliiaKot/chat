class ApperanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    current_user.is_online
  end

  def unsubscribed
    current_user.is_offline
  end
end
