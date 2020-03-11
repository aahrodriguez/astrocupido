class AddCoordinatesToAstrologyCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :astrology_charts, :latitude, :float
    add_column :astrology_charts, :longitude, :float
  end
end
