class Place < ActiveRecord::Base
  attr_accessible :name, :location_attributes, :icon

  mount_uploader :icon, PlaceIconUploader

  has_and_belongs_to_many :sports
  has_many :events, :dependent => :restrict
  has_one :location, :as => :locationable

  validates :name, :presence => true
  accepts_nested_attributes_for :location
end
