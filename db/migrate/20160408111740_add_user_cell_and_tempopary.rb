class AddUserCellAndTempopary < ActiveRecord::Migration
  def change
    add_column :users, :temporary, :uuid
    add_column :users, :cell, :string
  end
end
