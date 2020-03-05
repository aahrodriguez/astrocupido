class CreateAstrologyCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :astrology_charts do |t|
      t.integer :user_id
      t.integer :sun_id
      t.integer :moon_id
      t.integer :ascendant_id

      t.timestamps
    end
  end
end
