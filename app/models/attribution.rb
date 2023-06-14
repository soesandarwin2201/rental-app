class Attribution < ApplicationRecord
  validates :phone, presence: true, allow_blank: false
  validates :name, presence: true, length: { minimum: 3, message: 'Name must have 3 or more characters' }
  validates :company, presence: true, allow_blank: false
  validates :facebook, presence: true, allow_blank: true
  validates :address, presence: true, allow_blank: false
  belongs_to :house
end
