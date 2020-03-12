class Match < ApplicationRecord
  has_many :messages
  belongs_to :user_one, class_name: "User", dependent: :destroy
  belongs_to :user_two, class_name: "User", dependent: :destroy
end
