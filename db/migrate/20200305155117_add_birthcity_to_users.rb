class AddBirthcityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_city, :string
  end
end
