class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :name
      t.string  :email
      t.string  :cell
      t.string  :comment
      t.references :user
      t.references :stuff
      t.uuid  :temporary
      t.boolean :closed, default: :false
      t.integer :total

      t.timestamps
    end
  end
end
