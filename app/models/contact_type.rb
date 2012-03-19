class ContactType < ActiveRecord::Base
  attr_accessible :name, :icon
  mount_uploader :icon, IconUploader
  validate :name, :presence => true, :uniqueness => true
end
