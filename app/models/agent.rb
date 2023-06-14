class Agent < ApplicationRecord
     validates :name, presence: true, length: { minimum: 3, message: 'Name must have 3 or more characters' }
     validates :address, presence: true, allow_blank: false
     validates :details, presence: true, allow_blank: true,
                length: { maximum: 1000, message: 'Description must have less than 1000 characters' }
     has_many :phones, dependent: :destroy
end
