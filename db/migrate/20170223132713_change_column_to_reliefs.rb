class ChangeColumnToReliefs < ActiveRecord::Migration
  def up
    change_column :reliefs, :gs_BestbeforEnd, :datetime
    change_column :reliefs, :gs_BestbeforeStart, :datetime
  end
  
  def down
    change_column :reliefs, :gs_BestbeforEnd, :date
    change_column :reliefs, :gs_BestbeforeStart, :date
  end
end
