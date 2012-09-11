class Event < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :place
  belongs_to :sport
  attr_accessible :duration, :start_at, :sport_id, :place_id, :place_attributes, :max_number_members, :note

  validates :owner_id, :start_at, :duration, :presence => true
  accepts_nested_attributes_for :place
  
  has_many :event_members
  has_many :members, :through => :event_members
end