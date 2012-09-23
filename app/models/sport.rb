class Sport < ActiveRecord::Base
  attr_accessible :name, :season, :icon
  mount_uploader :icon, SportIconUploader
  validate :name, :presence => true, :uniqueness => true
  has_many :user_sports, :dependent => :destroy
  has_many :users, :through => :user_sports
  has_many :events
  has_and_belongs_to_many :places
end
