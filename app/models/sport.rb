class Sport < ActiveRecord::Base
  validate :name, :presence => true, :uniqueness => true
  has_many :user_sports, :dependent => :destroy
  has_many :users, :through => :user_sports
  has_many :events
end
