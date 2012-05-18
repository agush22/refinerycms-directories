class CreateDirectoryCategories < ActiveRecord::Migration

  def up
    create_table :refinery_directory_categories do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-directory"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/directory/categories"})
    end

    drop_table :refinery_directory_categories

  end

end
