class User < ActiveRecord::Base
  has_secure_password
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 6..33 }
  validates :password_confirmation, presence: true

  def name
    "#{self.firstName} #{self.lastName}"
  end

  def authenticate_with_credential
  end
end
