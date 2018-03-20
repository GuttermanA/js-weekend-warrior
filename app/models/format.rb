class Format < ApplicationRecord
  has_many :card_formats
  has_many :cards, through: :card_formats
  validates :name, uniqueness: true
end
