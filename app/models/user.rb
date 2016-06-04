class User < ActiveRecord::Base
  has_secure_password

  has_many :skills

  validates :username,      presence:   true,
                            uniqueness: true

  validates :password,      presence: true

  validates :email_address, presence:   true,
                            uniqueness: true

  validates :phone_number,  presence:   true,
                            uniqueness: true

  validates :role, presence: true
end
