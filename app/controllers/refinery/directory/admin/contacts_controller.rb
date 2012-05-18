module Refinery
  module Directory
    module Admin
      class ContactsController < ::Refinery::AdminController

        crudify :'refinery/directory/contact',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
