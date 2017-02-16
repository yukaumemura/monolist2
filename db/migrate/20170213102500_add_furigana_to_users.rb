class AddFuriganaToUsers < ActiveRecord::Migration
  def change
    # add_column :users, :furigana, :string
    # add_column :users, :post_num, :integer
    # add_column :users, :prefectures, :string
    # add_column :users, :municipality, :string
    # add_column :users, :area, :string
    # add_column :users, :building, :string
    # add_column :users, :tel, :integer
    
    # add_column :users, :fax, :integer
    add_column :users, :furigana,     :string
    add_column :users, :post_num,     :string
    add_column :users, :prefectures,  :string
    add_column :users, :municipality, :string
    add_column :users, :area,         :string
    add_column :users, :building,     :string
    add_column :users, :tel,          :string
    add_column :users, :fax,          :string
  end
end
