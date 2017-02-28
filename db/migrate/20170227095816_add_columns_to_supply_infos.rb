class AddColumnsToSupplyInfos < ActiveRecord::Migration
  def change
    add_column :supply_infos, :shs_sponsornamef, :string
    add_column :supply_infos, :shs_sponsorname, :string
    add_column :supply_infos, :shs_posnum, :string
    add_column :supply_infos, :shs_prefectures, :string
    add_column :supply_infos, :shs_municipality, :string
    add_column :supply_infos, :shs_streetnum, :string
    add_column :supply_infos, :shs_bill, :string
    add_column :supply_infos, :shs_contacts, :string
    add_column :supply_infos, :shs_remarks, :string
  end
end
