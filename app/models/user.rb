class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  has_many :messages
  default_scope {order(created_at: :asc)}
  scope :all_except, ->(user) { where.not(id: user) }
  has_secure_password
  after_create_commit { broadcast_append_to "users" }
end
