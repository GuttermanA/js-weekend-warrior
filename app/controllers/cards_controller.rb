class CardsController < ApplicationController
  def show
    @card = Card.find_by(card_params)
  end

  private

  def cards_params
    params.require(:card).permit(:name, :cmc, :mana_cost, :color_identity, :full_type, :rarity, :power, :toughnes)
  end
end
