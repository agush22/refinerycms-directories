class CreateDirectoryContacts < ActiveRecord::Migration

  def up
    create_table :refinery_directory_contacts do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :address
      t.integer :logo_id
      t.string :phone
      t.string :email
      t.string :contact
      t.text :info
      t.text :abstract
      t.string :web
      t.string :facebook
      t.string :twitter
      t.integer :position
      t.integer :category_id
      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-directory"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/directory/contacts"})
    end

    drop_table :refinery_directory_contacts

  end

end
