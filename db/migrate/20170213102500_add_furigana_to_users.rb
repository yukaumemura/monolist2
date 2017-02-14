class AddFuriganaToUsers < ActiveRecord::Migration
  def change
    binding.pry
    add_column :users, :furigana, :string
    add_column :users, :post_num,:integer
    add_column :users, :prefectures, :stirng
    add_column :users, :municipality, :stirng
    add_column :users, :area, :stirng
    add_column :users, :building, :stirng
    add_column :users, :tel, :integer
    
    add_column :users, :fax, :integer
  end
end
