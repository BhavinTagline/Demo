class User < ActiveRecord::Base
  rolify
  has_many :admin_depts
  has_many :departments, through: :admin_depts
  # accepts_nested_attributes_for :admin_depts
  accepts_nested_attributes_for :admin_depts

  after_create :assign_default_role

  validates :name, presence: true, length: { maximum: 50 }
  validates :age, numericality: { only_integer: true }
  validates :country, :presence => true

  enum gender: [:Male, :Female, :Other]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end

end
