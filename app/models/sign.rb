class Sign < ApplicationRecord
  has_many :astrology_chart
  validates :sign_name, uniqueness: true, presence: true
end
