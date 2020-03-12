class Match < ApplicationRecord
  has_many :messages
  belongs_to :user_one, class_name: "User", dependent: :destroy
  belongs_to :user_two, class_name: "User", dependent: :destroy
  def other_user(user)
    return user_two if user == user_one
    user_one
  end

end
