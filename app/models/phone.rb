class Phone < ApplicationRecord
  validates :phone, presence: true, allow_blank: false
  belongs_to :agent
end
