class AdminDept < ActiveRecord::Base

  belongs_to :user
  belongs_to :department

end
