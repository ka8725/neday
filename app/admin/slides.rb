ActiveAdmin.register Slide do
  index do
    column :id
    column :file do |slide|
      image_tag slide.file.url(:thumb)
    end
    column :title
    column :created_at
    column :updated_at
    default_actions
  end
end
