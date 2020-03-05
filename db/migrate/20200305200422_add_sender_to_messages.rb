class AddSenderToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :sender, foreign_key: { to_table: :users }
  end
end
