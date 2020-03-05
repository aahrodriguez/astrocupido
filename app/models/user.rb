class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"

  def matches
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    Match.where(user_one: self).or(user_two: self)
  end
end
