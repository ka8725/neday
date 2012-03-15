# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
      owner_id 1
      duration 1
      start_at "2012-03-15 02:37:40"
      place_id 1
      sport_id 1
      max_number_members 1
      note "MyText"
    end
end