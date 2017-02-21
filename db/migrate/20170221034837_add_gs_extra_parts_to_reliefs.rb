class AddGsExtraPartsToReliefs < ActiveRecord::Migration
  def change
    add_column :reliefs, :gs_ExtraParts, :integer
  end
end
