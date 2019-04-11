class ChangeTimestampNulls < ActiveRecord::Migration[5.2]
  def change
    change_table :gas_entries do |t|
      t.change :created_at, :datetime, null: false
      t.change :updated_at, :datetime, null: false
    end

    change_table :users do |t|
      t.change :created_at, :datetime, null: false
      t.change :updated_at, :datetime, null: false
    end
  end
end
