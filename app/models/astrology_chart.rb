class AstrologyChart < ApplicationRecord
  geocoded_by :birth_city
  after_validation :geocode
  has_many :signs
  belongs_to :user
  belongs_to :state

  def sun
    Sign.find_by(id: sun_id)
  end

  def moon
    Sign.find_by(id: moon_id)
  end

  def ascendant
    Sign.find_by(id: ascendant_id)
  end
end
