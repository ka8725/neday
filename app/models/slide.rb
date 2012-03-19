class Slide < ActiveRecord::Base
  attr_accessible :title, :description, :file
  mount_uploader :file, SlideUploader
  validate :title, :description, :presence => true
end
