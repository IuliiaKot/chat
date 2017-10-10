class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}

  has_secure_password

  has_many :conversations, foreign_key: :sender_id
  has_many :messages, through: :conversations

  def is_online
    self.update_attribute(:online, true)
    tmp = User.all.to_a
    AppearanceBroadcastJob.perform_later tmp
  end

  def is_offline
    self.update_attribute(:online, false)
    tmp = User.all.to_a
    AppearanceBroadcastJob.perform_later tmp
  end

  def list()
    User.where('online = ?',true)
  end

  # after_update_commit {AppearanceBroadcastJob.perform_later self}
end
