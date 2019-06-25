class CreateAdminDepts < ActiveRecord::Migration
  def change
    create_table :admin_depts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
