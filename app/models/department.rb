class Department < ActiveRecord::Base

  has_many :admin_depts, dependent: :destroy
  has_many :users, through: :admin_depts
  # has_many :admins, through: :admin_depts, source: :user
  accepts_nested_attributes_for :admin_depts

  has_many :employee_depts, dependent: :destroy
  has_many :employees, through: :employee_depts
  # has_many :employees, through: :employee_depts, source: :user
  accepts_nested_attributes_for :employee_depts

end
