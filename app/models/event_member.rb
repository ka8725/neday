class EventMember < ActiveRecord::Base
  belongs_to :event
  belongs_to :member, :class_name => 'User', :foreign_key => 'member_id'
end
