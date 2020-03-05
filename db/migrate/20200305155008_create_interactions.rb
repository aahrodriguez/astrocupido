class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :receiver_id, index:true, foreign_key: true
      t.boolean :like

      t.timestamps
    end
    add_foreign_key :interactions, :users, column: :sender_id
    add_foreign_key :interactions, :users, column: :receiver_id
  end
end
