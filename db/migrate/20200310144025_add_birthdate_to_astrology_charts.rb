class AddBirthdateToAstrologyCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :astrology_charts, :birthdate, :datetime
  end
end
