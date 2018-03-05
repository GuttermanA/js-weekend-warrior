standard_cards = MTG::Card.where(gameFormat: 'standard').all
# standard_cards.map {|card| puts "Type: #{card.type} Supertype: #{card.supertypes} Subtypes: #{card.subtypes}"}
# puts standard_cards.last.type
# puts standard_cards.last.supertypes
# puts standard_cards.last.subtypes

standard_cards.each do |card|
  new_card = Card.new(
    name: card.name,
    cmc: card.cmc,
    mana_cost: card.mana_cost,
    color_identity: card.color_identity.try(:join),
    base_type: card.type.split(" — ")[0].gsub("Legendary ", ""),
    rarity: card.rarity,
    power: card.power,
    toughness: card.toughness,
    text: card.text,
    img_url: card.image_url,
    game_format: 'standard'
  )
  new_card.save
end
