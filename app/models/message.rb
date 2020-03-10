class Message < ApplicationRecord
  belongs_to :match
  belongs_to :sender, class_name: 'User'
  validates :content, presence: true, allow_blank: false

    def from?(some_user)
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    sender == some_user
  end
end
