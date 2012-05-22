module Refinery
  module Directory
    class Category < Refinery::Core::BaseModel

      attr_accessible :title, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      has_many :contacts
    end
  end
end
