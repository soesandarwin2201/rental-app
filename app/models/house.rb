class House < ApplicationRecord
     has_many :images, dependent: :destroy
     has_many :addresses, dependent: :destroy
     has_many :attributions, dependent: :destroy
end
