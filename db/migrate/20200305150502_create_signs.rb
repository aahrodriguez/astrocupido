class CreateSigns < ActiveRecord::Migration[5.2]
  def change
    create_table :signs do |t|
      t.string :sign_name
      t.string :icon_url
      t.string :image_url

      t.timestamps
    end
  end
end
