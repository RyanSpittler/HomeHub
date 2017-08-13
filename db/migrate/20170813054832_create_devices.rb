class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :ip_address
      t.string :port
      t.string :type

      t.timestamps null: false
    end
  end
end
