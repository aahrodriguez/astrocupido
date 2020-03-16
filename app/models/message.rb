class Message < ApplicationRecord
  after_create :broadcast_message
  belongs_to :match
  belongs_to :sender, class_name: 'User', dependent: :destroy
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    sender == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.match.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: sender.id
    }
  end
end
