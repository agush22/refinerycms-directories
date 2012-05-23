class AddSlugToDirectoryContacts < ActiveRecord::Migration
  def change
    add_column :refinery_directory_contacts, :slug, :string
    add_index :refinery_directory_contacts, :slug
  end
end
