class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..250, message: 'Must be a string of at least 3 characters' }
  validates :email, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  
end
