class LoginIdToUserIdRecipient < ActiveRecord::Migration
  def change
    rename_column :recipients, :login_id, :user_id
  end
end
