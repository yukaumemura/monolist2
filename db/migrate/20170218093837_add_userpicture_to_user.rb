class AddUserpictureToUser < ActiveRecord::Migration
  def change
    add_column :users, :userpicture, :string
  end
end
