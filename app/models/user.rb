class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  validates :username, presence: true
  has_one_attached :avatar
  has_many_attached :photos
  has_many :interactions
  belongs_to :state, optional: true
  has_one :astrology_chart

  def matches
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    Match.where(user_one: self).or(Match.where(user_two: self))
  end

  def interactions
    Interaction.where(sender: self).or(Interaction.where(receiver: self))
  end
end
