class User < ActiveRecord::Base
  rolify
  has_many :admin_depts, dependent: :destroy, foreign_key: :user_id
  has_many :departments, through: :admin_depts
  accepts_nested_attributes_for :admin_depts

  has_one :user_organization
  has_one :organization, through: :user_organization
  accepts_nested_attributes_for :user_organization

  has_one :admin_organization, class_name: "Organization", foreign_key: :user_id

  # scope :admin, -> { order("name") }
  # scope :employee, -> { order("id") }

  after_create :assign_default_role
  attr_accessor :department_id
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, numericality: { only_integer: true }
  validates :country, :presence => true

  enum gender: [:Male, :Female, :Other]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # def admin_organizations
  #   p   self.inspect
  #   if self.has_role?(:admin)
  #     Organization.where(user_id: self.id)
  #   end
  # end

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end
  #
  # def add_field
  #   if @user.has_role? :employee
  #     add_reference :users, :organization, foreign_key: true
  #   end
  # end
end
