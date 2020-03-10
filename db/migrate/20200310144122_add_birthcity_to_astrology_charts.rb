class AddBirthcityToAstrologyCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :astrology_charts, :birth_city, :string
  end
end
