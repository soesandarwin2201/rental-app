class Agent < ApplicationRecord
     has_many :phones, dependent: :destroy
end
