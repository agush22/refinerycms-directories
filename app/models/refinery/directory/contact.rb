require 'acts-as-taggable-on'

module Refinery
  module Directory
    class Contact < Refinery::Core::BaseModel
    extend FriendlyId
    friendly_id :name, :use => [:slugged]

    self.per_page = 5

    attr_accessible :name, :position, :city, :state, :zip_code, :address
    attr_accessible :logo_id, :phone, :email, :contact, :info, :abstract, :web, :facebook
    attr_accessible :twitter, :tag_list, :category_ids

    acts_as_indexed :fields => [:name]

    validates :name, :presence => true, :uniqueness => true

    belongs_to :logo, :class_name => '::Refinery::Image'
    has_and_belongs_to_many :categories

    acts_as_taggable
    end
  end
end
