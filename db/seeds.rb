standard_cards = MTG::Card.where(gameFormat: 'standard').all
# standard_cards.map {|card| puts card.color_identity.try(:size)}
# puts standard_cards.last.color_identity

standard_cards.each do |card|
  new_card = Card.new(
    name: card.name,
    cmc: card.cmc,
    mana_cost: card.mana_cost,
    color_identity: card.color_identity.try(:join),
    full_type: card.type,
    rarity: card.rarity,
    power: card.power,
    toughness: card.toughness,
    img_url: card.image_url,
    game_format: 'standard'
  )
  new_card.save
end
