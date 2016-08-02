class AddIndexToUserUni < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :uni, unique: true
  end
end
