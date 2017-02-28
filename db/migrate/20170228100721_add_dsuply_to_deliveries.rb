class AddDsuplyToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :supply_info_id, :integer
  end
end
