class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :name

      t.timestamps
    end
    add_reference :orders, :order_status
  end
end
