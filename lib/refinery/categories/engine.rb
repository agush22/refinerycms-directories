module Refinery
  module Directory
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Directory

      engine_name :refinery_directory

      initializer "register refinerycms_categories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.directory_admin_categories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/directory/category'
          }
          plugin.menu_match = %r{refinery/directory/categories(/.*)?$}
          plugin.hide_from_menu = true
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Categories)
      end
    end
  end
end
