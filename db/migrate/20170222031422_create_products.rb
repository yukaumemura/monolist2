class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :gsname
      t.string :gsgoodsSize
      t.date :gsBestbeforeStart
      t.date :gs_BestbeforEnd

      t.timestamps null: false
    end
  end
end
