class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}

  has_secure_password

  has_many :conversations, foreign_key: :sender_id
  has_many :messages, through: :conversations
end
