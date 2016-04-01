class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :color_gid

      t.timestamps
    end
  end
end
