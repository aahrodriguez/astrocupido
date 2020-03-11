class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  geocoded_by :birth_city
  after_validation :geocode
  validates :username, presence: true
  has_many_attached :photos
  has_many :interactions
  belongs_to :state, optional: true
  has_one :astrology_chart


end
