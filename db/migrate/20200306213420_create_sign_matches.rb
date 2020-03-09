class CreateSignMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :sign_matches do |t|
      t.references :sign_one, foreign_key: { to_table: "signs" }
      t.references :sign_two, foreign_key: { to_table: "signs" }
      t.integer :percentage

      t.timestamps
    end
  end
end
