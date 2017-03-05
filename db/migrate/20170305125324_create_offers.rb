class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :exe_name
      t.exe_time :datetime
      t.integer :exe_id
      t.string :exe_prefectures
      t.string :exe_municipality
      t.string :exe_comment
      t.string :exe_infolink
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
