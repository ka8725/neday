class Slide < ActiveRecord::Base
  mount_uploader :file, SlideUploader
  validate :title, :description, :presence => true
end
