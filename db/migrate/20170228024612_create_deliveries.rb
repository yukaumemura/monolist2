class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :dly_posnum
      t.string :dly_prefectures
      t.string :dly_municipality
      t.string :dly_streetnum
      t.string :dly_bill
      t.string :dly_contacts
      t.string :dly_remarks

      t.timestamps null: false
    end
  end
end
