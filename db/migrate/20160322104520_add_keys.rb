class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "dashboards", "users", name: "dashboards_user_id_fk"
    add_foreign_key "identities", "users", name: "identities_user_id_fk"
  end
end
