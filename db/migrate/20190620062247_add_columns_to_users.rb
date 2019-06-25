class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :country, :string
    # add_column :users, :joining_date, :datetime
    add_column :users, :gender, :integer
  end
end
