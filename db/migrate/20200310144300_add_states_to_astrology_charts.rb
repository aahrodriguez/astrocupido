class AddStatesToAstrologyCharts < ActiveRecord::Migration[5.2]
  def change
    add_reference :astrology_charts, :state, foreign_key: true
  end
end
