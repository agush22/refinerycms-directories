module Refinery
  module Directory
    class Category < Refinery::Core::BaseModel
    extend FriendlyId
      friendly_id :title, :use => [:slugged]

      attr_accessible :title, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      has_many :contacts
    end
  end
end
