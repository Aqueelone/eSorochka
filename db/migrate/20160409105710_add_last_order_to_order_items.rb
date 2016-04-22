class AddLastOrderToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :last_order
  end
end
