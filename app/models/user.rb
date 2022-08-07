class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  has_many :messages
  default_scope {order(created_at: :asc)}
  has_secure_password
end
