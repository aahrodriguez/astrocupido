class AstrologyChart < ApplicationRecord
  geocoded_by :birth_city
  after_validation :geocode
  has_many :sign
  belongs_to :user
  belongs_to :state

end
