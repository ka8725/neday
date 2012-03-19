class Place < ActiveRecord::Base
  has_many :events, :dependent => :restrict
  has_one :location, :as => :locationable
end
