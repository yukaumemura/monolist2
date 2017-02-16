class CreateReliefs < ActiveRecord::Migration
  def change
    create_table :reliefs do |t|
      t.integer :gs_ID
      t.string :gs_name
      t.string :gs_sizeEvent
      t.string :gs_goodsSize
      t.integer :gs_dbweight
      t.integer :gs_dbboxcount
      t.integer :gs_dbboxsize
      t.integer :gs_dbweight
      t.data :gs_BestbeforEnd
      t.data :gs_BestbeforeStart
      t.integer :gs_NowNum
      t.integer :gs_shortages
      t.string :goos_note

      t.timestamps null: false
    end
  end
end
