class AddOAuthSupport < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :index => true
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_moderator, :boolean, :default => false
    add_column :users, :confirmation_token, :string, :unique => true
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    User.update_all(:confirmed_at => Time.now)

    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :uid
      t.timestamps null: false
    end

    create_table :dashboards do |t|
      t.references :user, index: true, foreign_key: true
      t.references :messenger, index: true, foreign_key: true
      t.timestamps null: false
    end

    create_table :messengers do |t|
      t.timestamps null: false
    end
  end
end
