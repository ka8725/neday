# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
      city "MyString"
      country "MyString"
      country_code "MyString"
      state "MyString"
      state_code "MyString"
      postal_code "MyString"
      latitude 1.5
      longitude 1.5
      locationable_id 1
      locationable_type "MyString"
    end
end