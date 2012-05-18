module Refinery
  module Directory
    class Contact < Refinery::Core::BaseModel

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name, :city, :state, :zip_code, :address, :phone, :email, :contact, :info, :abstract, :web, :facebook, :twitter]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
