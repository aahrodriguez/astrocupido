class AddLikewomanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like_woman, :boolean
  end
end
