class AddImageToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :attachement, :string
    add_column :categories, :image_id, :string
  end
end
