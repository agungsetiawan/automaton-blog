class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true, uniqueness: {case_sensitve: false}
  validates :email, presence: true, uniqueness: {case_sensitve: false}
  #no need since has_secure_password has enabled it
  #validates :password, presence: true
  validates :bio, presence: true

end
