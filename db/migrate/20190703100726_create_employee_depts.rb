class CreateEmployeeDepts < ActiveRecord::Migration
  def change
    create_table :employee_depts do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
