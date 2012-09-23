class RemoveDurationFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :duration
  end

  def down
    add_column :events, :duration, :integer
  end
end
