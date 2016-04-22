class AddCategoryToGalleryEtc < ActiveRecord::Migration
  def change
    add_reference :galleries, :category
    add_reference :images, :category
    add_reference :fabrics, :category
  end
end
