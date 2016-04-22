class AddGalleryToImages < ActiveRecord::Migration
  def change
    add_reference :images, :gallery, index: true, foreign_key: true
  end
end
