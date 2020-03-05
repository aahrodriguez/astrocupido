class AddLikemanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like_man, :boolean
  end
end
