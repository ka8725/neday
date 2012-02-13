# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide do
    sequence(:file) { |n| File.new(File.join(Rails.root, "spec/images/slide#{n % 2}.jpg")) }
    title Faker::Name.title
    description Faker::Lorem.paragraph
  end
end
