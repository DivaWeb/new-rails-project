class ChangeWikisToPrivate < ActiveRecord::Migration[5.2]
  def change
    change_column :wikis, :private, :boolean, :default => false
  end
end
