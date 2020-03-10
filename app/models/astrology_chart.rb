class AstrologyChart < ApplicationRecord
  geocoded_by :birth_city
  after_validation :geocode
  has_many :signs
  belongs_to :user
  belongs_to :state

end
