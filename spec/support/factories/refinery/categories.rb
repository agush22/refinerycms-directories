
FactoryGirl.define do
  factory :category, :class => Refinery::Directory::Category do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

