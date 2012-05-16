class Place < ActiveRecord::Base
  attr_accessible :name, :location_attributes

  has_many :events, :dependent => :restrict
  has_one :location, :as => :locationable

  accepts_nested_attributes_for :location
end
