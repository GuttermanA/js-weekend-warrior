class CardsController < ApplicationController

  def index
    @cards = Card.where(card_params).limit(5)
    render json: @cards
  end

  def show

    @card = Card.find_by(card_params)
  end

  private

  def card_params
    params.require(:card).permit(:name, :cmc, :mana_cost, :color_identity, :base_type, :rarity, :power, :toughness)
  end
end
