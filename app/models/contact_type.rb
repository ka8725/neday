class ContactType < ActiveRecord::Base
  mount_uploader :icon, IconUploader
  validate :name, :presence => true, :uniqueness => true
end
