# Model for a user
class User < ActiveRecord::Base
  validates_presence_of [:email, :encrypted_password, :salt]
  validates_uniqueness_of :email

  validates_format_of :email, with: /.+@.+\..+/
end
