class AstrologyChart < ApplicationRecord
  has_many :signs
  belongs_to :user
end
