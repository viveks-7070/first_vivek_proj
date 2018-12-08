class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|

      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.timestamps null: false
    end
  end
end
