class AddUuidInOrderItem < ActiveRecord::Migration
  def change
    remove_column :order_items, :temporary, :string
    add_column :order_items, :temporary, :uuid
  end
end
