class RemovePortFromDevices < ActiveRecord::Migration
  def change
    remove_column :devices, :port
  end
end
