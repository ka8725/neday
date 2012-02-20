class UserContact < ActiveRecord::Base
  attr_accessible :user_id, :value
  belongs_to :user
  validates :value, :user_id, :presence => true
end
