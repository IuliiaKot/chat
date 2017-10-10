class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(list)
    # debugger
    ActionCable.server.broadcast 'appearance_channel', appearances: list
  end
end
