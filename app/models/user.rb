# Model for a user
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_secure_password

  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: { case_sensitive: false },
                    format: /.+@.+\..+/

  validates :password, presence: true, length: { minimum: 6 }
end
