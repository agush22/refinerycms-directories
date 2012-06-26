class AddUserIdToDirectoryContacts < ActiveRecord::Migration
  def change
    add_column :refinery_directory_contacts, :user_id, :integer
  end
end
