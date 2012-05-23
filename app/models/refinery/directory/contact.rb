module Refinery
  module Directory
    class Contact < Refinery::Core::BaseModel
    extend FriendlyId
      friendly_id :name, :use => [:slugged]

      attr_accessible :name, :position, :category_id, :city, :state, :zip_code, :address, :logo_id, :phone, :email, :contact, :info, :abstract, :web, :facebook, :twitter

      acts_as_indexed :fields => [:name, :city, :state, :zip_code, :address, :phone, :email, :contact, :info, :abstract, :web, :facebook, :twitter]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
      belongs_to :category
    end
  end
end
