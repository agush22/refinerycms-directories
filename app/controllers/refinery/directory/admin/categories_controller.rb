module Refinery
  module Directory
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/directory/category', :xhr_paging => true

      end
    end
  end
end
