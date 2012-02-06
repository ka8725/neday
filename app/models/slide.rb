class Slide < ActiveRecord::Base
  mount_uploader :file, SlideUploader
end
