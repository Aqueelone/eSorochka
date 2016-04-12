class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :amount
      t.references :product_code
      t.references :order
      t.references :user
      t.string  :temporary
      t.timestamps
    end
  end
end
