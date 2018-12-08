class UserIdToLoginIdRecipient < ActiveRecord::Migration
  def change
    rename_column :recipients, :user_id, :login_id
  end
end
