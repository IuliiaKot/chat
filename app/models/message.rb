class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :conversation
  belongs_to :user

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
