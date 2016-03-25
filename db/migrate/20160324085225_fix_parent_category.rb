class FixParentCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :parent, index: true
    remove_reference :categories, :parent_id, index:true
  end
end
