# Model for a user
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /.+@.+\..+/
end
