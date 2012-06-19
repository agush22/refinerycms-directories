module Refinery
  module Directory
    module Admin
      class ContactsController < ::Refinery::AdminController

        crudify :'refinery/directory/contact',
                :title_attribute => 'name', :xhr_paging => true

        before_filter :empty_checkboxes, :only => :update
        protected

        def empty_checkboxes
          params[:contact][:category_ids] ||= []
        end

      end
    end
  end
end
