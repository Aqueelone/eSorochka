class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.boolean :show
      t.integer :amount_min
      t.integer :amount_max
      t.integer :price_min
      t.integer :price_max
      t.string :cut_type
      t.string :collar_type
      t.string :sleeve_type
      t.string :cuff_type
      t.string :style_type
      t.references :brand
      t.references :category
      t.references :picture

      t.timestamps
    end

    create_table :products_sizes, force: true, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :size, index: true
    end

    add_reference :galleries, :product, index: true, foreign_key: true
  end
end
