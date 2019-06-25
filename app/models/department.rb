class Department < ActiveRecord::Base

  has_many :admin_depts
  has_many :users, through: :admin_depts
  # accepts_nested_attributes_for :admin_depts
  # accepts_nested_attributes_for :users

end
