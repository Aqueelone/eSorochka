class AddImageIdToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :image_id, :string
  end
end
