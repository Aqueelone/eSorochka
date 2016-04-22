class AddColorAndFabricToGallery < ActiveRecord::Migration
  def change
    add_reference :galleries, :color, index: true, foreign_key: true
    add_reference :galleries, :fabric, index: true, foreign_key: true
  end
end
