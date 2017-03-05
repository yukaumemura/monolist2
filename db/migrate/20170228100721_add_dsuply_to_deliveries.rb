class AddDsuplyToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :supply_info_id, :integer
    add_column :deliveries, :dly_name, :string
     add_column :deliveries, :user_id, :integer
  end
end
