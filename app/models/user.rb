class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  has_many :messages, dependent: :destroy
  default_scope {order(created_at: :asc)}
  scope :all_except, ->(user) { where.not(id: user) }
  has_secure_password
  default_scope {order(updated_at: :desc)}
  after_create_commit { broadcast_append_to "users" }


  def online?
    updated_at > 2.minutes.ago
  end
end
