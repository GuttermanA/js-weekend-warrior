class Card {
  constructor({ name, cmc, mana_cost, color_identity, base_type, rarity, power, toughness, text, img_url }) {
    this.name = name
    this.cmc = cmc
    this.manaCost = mana_cost
    this.colorIdentity = color_identity
    this.type = base_type
    this.rarity = rarity
    this.power = power
    this.toughness = toughness
    this.imgUrl = img_url
    this.text = text
  }

  render() {
    let baseCardHTML = `
    <div>
      <img src="${this.imgUrl}" alt="${this.name}">
      <ul>
        <li>Card Name: ${this.name}</li>
        <li>Mana Cost: ${this.manaCost}</li>
        <li>Converted Mana Cost: ${this.cmc}</li>
        <li>Types: ${this.type}</li>
        <li>Card Text: ${this.text}</li>

    `
    if (this.type.toLowerCase().includes('creature')) {
      baseCardHTML += `<li>P/T:${this.power}/${this.toughness}</li></ul></div>`
      return baseCardHTML
    } else {
      baseCardHTML += '</ul></div>'
      return baseCardHTML
    }
  }

  static renderCards(json) {
    let renderedCards = []
    for(let card of json) {
      let cardObject = new Card(card)
      renderCards.push(cardObject.render())
    }
    return renderedCards
  }
}
