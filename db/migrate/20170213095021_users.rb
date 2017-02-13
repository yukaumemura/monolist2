class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nameFurigana
     
    end
  end
end
