class Admin < User

  default_scope -> { User.with_role(:admin) }
  # has_one :organization, foreign_key: :user_id

end
