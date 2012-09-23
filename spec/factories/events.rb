# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association           :owner, :factory => :user
    start_at              10.days.since
    association           :place
    association           :sport
  end
end
