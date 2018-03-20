class MtgSet < ApplicationRecord
  has_many :cards
  validates :name, uniqueness: true
end
