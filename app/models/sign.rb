class Sign < ApplicationRecord
  has_many :astrology_charts
  validates :sign_name, uniqueness: true, presence: true
end
