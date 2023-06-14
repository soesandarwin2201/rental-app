class Image < ApplicationRecord
  belongs_to :house
  validates :link, presence: true, allow_blank: false
end
