class CreateSupplyInfos < ActiveRecord::Migration
  def change
    create_table :supply_infos do |t|
      t.datetime :shs_today
      t.string :shs_name
      t.string :shs_sizeEvent
      t.string :shs_goodsSize
      t.integer :shs_Lackofgdsdbox
      t.integer :shs_Lackofgds
      t.integer :shs_Surplusitemdbox
      t.integer :shs_Surplusitem
      t.integer :shs_note

      t.timestamps null: false
    end
  end
end
