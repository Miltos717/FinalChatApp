class Message < ApplicationRecord
  validates :body,presence: true
  belongs_to :user
  # we take the last 10 messages from the db
  # this method i used it in the chatroom controller
  scope :custom_display, -> {order(:created_at).last(20)}

end
