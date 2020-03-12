class Match < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"

  def other_user(user)
    return user_two if user == user_one
    user_one
  end
end
