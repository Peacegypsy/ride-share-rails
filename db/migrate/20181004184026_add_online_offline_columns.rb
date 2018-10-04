class AddOnlineOfflineColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :online, :boolean, :default => true
    add_column :passengers, :online, :boolean, :default => true
  end
end
