class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :description
      t.string :attachement
      t.string :file_id
      t.timestamps
    end
  end
end
