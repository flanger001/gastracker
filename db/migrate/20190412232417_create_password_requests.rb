class CreatePasswordRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :password_requests do |t|
      t.references :user, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
