class CreateProductCodes < ActiveRecord::Migration
  def change
    create_table :product_codes do |t|
      t.string :name
      t.references :product
      t.references :category
      t.references :color
      t.references :picture

      t.timestamps
    end
  end
end
