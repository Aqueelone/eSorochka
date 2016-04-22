class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :name

      t.timestamps
    end
    add_reference :orders, :payment_type
  end
end
