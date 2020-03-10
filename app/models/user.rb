class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  validates :username, presence: true
  geocoded_by :birth_city
  after_validation :geocode
  has_one_attached :photo
  # has_many_attached :photos
  belongs_to :state

  def matches
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    Match.where(user_one: self).or(user_two: self)
  end
end
