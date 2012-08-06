class EventMember < ActiveRecord::Base
  belongs_to :event
  belongs_to :member, :class_name => 'User', :foreign_key => 'user_id'
end