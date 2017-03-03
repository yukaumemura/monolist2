class AddUserIdToSupplyInfos < ActiveRecord::Migration
  def change
    add_column :supply_infos, :user_id, :integer
    
  end
end
