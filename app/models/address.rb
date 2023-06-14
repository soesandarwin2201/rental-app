class Address < ApplicationRecord
  validates :city, presence: true, allow_blank: false
  validates :street, presence: true, allow_blank: false
  validates :zone, presence: true, allow_blank: false
  validates :zipcode, presence: true, allow_blank: true
  belongs_to :house
end
