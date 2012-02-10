class AddVkontakteIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vkontakte_id, :string

  end
end
