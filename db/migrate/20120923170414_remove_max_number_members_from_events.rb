class RemoveMaxNumberMembersFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :max_number_members
  end

  def down
    add_column :events, :max_number_members, :integer
  end
end
