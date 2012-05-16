# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :owner, :factory => :user
    duration 112543
    start_at 10.days.since
    association :place
    association :sport
    max_number_members {rand(10) + 1}
  end
end
