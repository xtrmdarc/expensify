class User < ApplicationRecord
  has_many :measurements

  has_secure_password

end
