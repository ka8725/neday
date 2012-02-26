class UserSport < ActiveRecord::Base
  attr_accessible :user_id, :sport_id
  validates :user_id, :sport_id, :presence => true
  validates :sport_id, :uniqueness => {:scope => :user_id}
  belongs_to :user
  belongs_to :sport
end
