module Refinery
  module Directory
    class ContactsController < ::ApplicationController

      before_filter :find_all_contacts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact in the line below:
        present(@page)
      end

      def show
        @contact = Contact.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact in the line below:
        present(@page)
      end

    protected

      def find_all_contacts
        @contacts = Contact.page(params[:page]).order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contacts").first
      end

    end
  end
end
