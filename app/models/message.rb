class Message < ApplicationRecord
   after_create :broadcast_message
  belongs_to :match
  belongs_to :sender, class_name: 'User'
  validates :content, presence: true, allow_blank: false

    def from?(some_user)
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    sender == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.match.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, current_user: sender }
      ),
      current_user_id: sender.id
    })
  end
end
