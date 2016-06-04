class AddMoreVerboseContactInfoToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :contact_info
    add_column :users, :email_address, :string
    add_column :users, :phone_number, :string
  end
end
