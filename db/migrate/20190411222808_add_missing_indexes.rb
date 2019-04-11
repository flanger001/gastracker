class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :vehicles, :user_id
  end
end
