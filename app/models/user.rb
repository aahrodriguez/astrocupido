class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id", dependent: :destroy
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id", dependent: :destroy
  validates :username, presence: true
  has_one_attached :avatar
  has_many_attached :photos
  has_many :interactions, dependent: :destroy
  belongs_to :state, optional: true
  has_one :astrology_chart, dependent: :destroy

  def matches
    # current_user.matches ==> Match.where(user_one: current_user).or(user_two: current_user)
    Match.where(user_one: self).or(Match.where(user_two: self))
  end

  def interactions
    Interaction.where(sender: self).or(Interaction.where(receiver: self))
  end

  def sun_percentage(user)
    SignMatch.find_by(sign_one_id: astrology_chart.sun_id, sign_two_id: user.astrology_chart.sun_id).percentage
  end

  def moon_percentage(user)
    SignMatch.find_by(sign_one_id: astrology_chart.moon_id, sign_two_id: user.astrology_chart.moon_id).percentage
  end

  def ascendant_percentage(user)
    SignMatch.find_by(sign_one_id: astrology_chart.ascendant_id, sign_two_id: user.astrology_chart.ascendant_id).percentage
  end

  def match_percentage(user)
    match_result =
      (sun_percentage(user) * 3) +
      (moon_percentage(user) * 2) +
      ascendant_percentage(user)

    match_result/6
  end
end
