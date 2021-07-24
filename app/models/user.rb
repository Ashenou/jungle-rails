class User < ActiveRecord::Base
  has_secure_password

  def name
    "#{self.firstName} #{self.lastName}"
  end
end
