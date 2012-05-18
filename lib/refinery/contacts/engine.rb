module Refinery
  module Directory
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Directory

      engine_name :refinery_directory

      initializer "register refinerycms_contacts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contacts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.directory_admin_contacts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/directory/contact',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/directory/(categories|contacts)(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Contacts)
      end
    end
  end
end
