class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :gsname
      t.string :gsgoodsSize
      t.string :gsgoodsSize
      t.data :gsBestbeforeStart
      t.boolean :gs_BestbeforEnd

      t.timestamps null: false
    end
  end
end
