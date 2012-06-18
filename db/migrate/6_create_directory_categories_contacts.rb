class CategoriesContacts < ActiveRecord::Migration
  def up
    create_table :refinery_directory_categories_contacts, :id => false do |t|
      t.references :refinery_directory_category, :null => false
      t.references :refinery_directory_contact, :null => false
    end
    add_index(:refinery_directory_categories_contacts, [:category_id, :contact_id], :unique => true)
  end

  def down
    drop_table :refinery_directory_categories_contacts
  end
end
