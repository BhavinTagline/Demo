class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.string :email

      t.timestamps null: false
    end
  end
end
