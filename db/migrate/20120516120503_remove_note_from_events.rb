class RemoveNoteFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :note
      end

  def down
    add_column :events, :note, :text
  end
end
