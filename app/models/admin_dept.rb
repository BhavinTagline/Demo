class AdminDept < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  # accepts_nested_attributes_for :departments

end
