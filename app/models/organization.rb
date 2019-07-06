class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :user_organizations
  has_many :employees, through: :user_organizations
  # accepts_nested_attributes_for :user_organizations
  # def admin_organizations
  #   # p   self.inspect
  #   # if self.has_role?(:admin)
  #      Organization.where(id: self.user_id)
  #   # end
  # end

  has_many :admin_depts, primary_key: :user_id, foreign_key: :user_id
  has_many :departments, through: :admin_depts

end
