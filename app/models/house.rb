class House < ApplicationRecord
     validates :name, presence: true, length: { minimum: 3, message: 'Name must have 3 or more characters' }
     validates :bedrooms, presence: true, allow_blank: true
     validates :bathrooms, presence: true, allow_blank: true
     validates :country, presence: true, allow_blank: true
     validates :house_status, presence: true
     validates :latitude, presence: true
     validates :longitude, presence: true
     validates :price, presence: true,
                numericality: { greater_than: 0, message: 'Price must be greater than 0' }
     validates :update_date, presence: true
     validates :detail, presence: true, allow_blank: true,
                length: { maximum: 1000, message: 'Description must have less than 1000 characters' }
     validates :square, presence: true
     has_many :images, dependent: :destroy
     has_many :addresses, dependent: :destroy
     has_many :attributions, dependent: :destroy
end
