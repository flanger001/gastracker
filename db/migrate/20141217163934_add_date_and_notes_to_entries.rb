class AddDateAndNotesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :date, :date
    add_column :entries, :notes, :string
  end
end
