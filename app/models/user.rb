class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..250, message: 'Name must be a string of at least 3 characters' }
  validates :email, presence: true, uniqueness: true
  validates :company_name, presence: true, length: { in: 3..250, message: 'Comapany Name must be  least 3 characters' }
  validates :address, presence: true
  validates :detail, presence: true, allow_blank: true,
                length: { maximum: 1500, message: 'Description must have less than 1500 characters' }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :houses
  has_many :phones
end
