class SupplyInfos < ActiveRecord::Migration
  def change
     add_column :supply_infos, :shs_dlyid, :integer
  end
end
