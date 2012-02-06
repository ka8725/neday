class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :file
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
