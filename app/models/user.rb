class User < ApplicationRecord
  has_secure_password

  has_many :subscriptions, dependent: :destroy
  has_many :companies, through: :subscriptions

  # validates comes from active record NOT rails specific method. Can use this in any programming library useing active record
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
