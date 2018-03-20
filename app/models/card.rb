class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  has_many :card_formats
  has_many :formats, through: :card_formats
  has_many :card_colors
  has_many :colors, through: :card_colors

  belongs_to :mtg_set
  validates :name, uniqueness: true
  validates :img_url, presence: true
  # joins is inner join
  # includes is left join
  scope :colors, -> (args) { joins(:colors).where('colors.name': args).references(:colors) }
  scope :wildcard, -> (column, arg) { where("#{column} = %?%", arg)}

  def self.search(card_params)
    name_wildcard_search = "%#{card_params["name"]}%"
    type_wildcard_search = "%#{card_params["type"]}%"

    Card.where("name LIKE ? OR base_type LIKE ?", name_wildcard_search, type_wildcard_search)
  end
end
