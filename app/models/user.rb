class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: {minimum: 4}
  belongs_to :city, optional: true
  has_many :gossips, dependent: :destroy 
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :comments
end
