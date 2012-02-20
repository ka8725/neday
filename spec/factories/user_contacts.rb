# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_contact do
      contact_type_id 1
      value "MyString"
    end
end