class CategoriesContacts < ActiveRecord::Migration
  def up
    create_table :categories_contacts, :id => false do |t|
      t.references :category, :null => false
      t.references :contact, :null => false
    end
    add_index(:categories_contacts, [:category_id, :contact_id], :unique => true)
  end

  def down
    drop_table :categories_contacts
  end
end
