class UserContact < ActiveRecord::Base
  attr_accessible :user_id, :value, :contact_type_id
  belongs_to :user
  belongs_to :contact_type
  validates :value, :user_id, :contact_type_id, :presence => true
end
