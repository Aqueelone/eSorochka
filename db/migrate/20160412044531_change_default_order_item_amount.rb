class ChangeDefaultOrderItemAmount < ActiveRecord::Migration
  def change
    change_column_default :order_items, :amount,  1
  end
end
