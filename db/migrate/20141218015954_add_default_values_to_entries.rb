class AddDefaultValuesToEntries < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.change_default :odometer, 0
      t.change_default :gallons, 0
      t.change_default :distance, 0
      t.change_default :cost, 0
    end
  end

  def down
    change_table :entries do |t|
      t.change_default :odometer, nil
      t.change_default :gallons, nil
      t.change_default :distance, nil
      t.change_default :cost, nil
    end
  end
end
