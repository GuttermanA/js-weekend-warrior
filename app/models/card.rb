class Card < ApplicationRecord
  has_many :decks, through: :deck_cards
  validates :name, uniqueness: true
end
