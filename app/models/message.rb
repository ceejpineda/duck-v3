class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel, dependent: :destroy

  #YOU CAN TARGET THE NAME OF THE TURBO STREAM!!! STUCK ON THIS FOR A WHILE 1 day
  after_create_commit do
    broadcast_append_to "messages_#{self.channel_id}", partial: "partials/message", locals: { message: self }
  end
end
