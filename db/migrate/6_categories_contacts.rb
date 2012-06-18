class CategoriesContacts < ActiveRecord::Migration
  def up
    create_table :refinery_directory_categories_contacts, :id => false do |t|
        t.column :category_id, :integer, :null => false
        t.column :contact_id, :integer, :null => false
    end
    add_index(:refinery_directory_categories_contacts, [:category_id, :contact_id], :unique => true)
  end

  def down
    drop_table :refinery_directory_categories_contacts
  end
end
