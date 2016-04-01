class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :name
      t.string :description
      t.string :composition
      t.string :attachement
      t.string :image_id

      t.timestamps
    end
  end
end
