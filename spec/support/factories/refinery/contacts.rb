
FactoryGirl.define do
  factory :contact, :class => Refinery::Directory::Contact do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

