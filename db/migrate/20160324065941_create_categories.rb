class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_ua
      t.string :name_ru
      t.string :name_en
      t.references :parent, index: true

      t.timestamps
    end
  end
end
