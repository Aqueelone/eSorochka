class AddAttachementToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :attachement, :string
  end
end
