class User < ActiveRecord::Base
  has_many :rounds

  def self.authenticate(email,password)
    User.where(email: email, password: password).first
  end
end