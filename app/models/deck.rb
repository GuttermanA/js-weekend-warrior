class Deck < ApplicationRecord
  has_many :cards. through: :deck_cards
end
