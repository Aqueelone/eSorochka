class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :image_galleries, force: true, id: false do |t|
      t.belongs_to :image, index: true
      t.belongs_to :gallery, index: true
    end
  end
end
