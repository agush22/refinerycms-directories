class AddSlugToDirectoryCategories < ActiveRecord::Migration
  def change
    add_column :refinery_directory_categories, :slug, :string
    add_index :refinery_directory_categories, :slug
  end
end
