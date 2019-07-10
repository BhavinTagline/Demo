class Employee < User
  # self.table_name = "users"
  default_scope -> { User.with_role(:employee) }

  has_many :employee_depts, dependent: :destroy
  has_many :departments, through: :employee_depts
  accepts_nested_attributes_for :employee_depts
  # has_many :jobs, foreign_key: "user_id", class_name: "Task"




end
