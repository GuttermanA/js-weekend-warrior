class App {
  constructor() {
    this.cardSearchForm = document.getElementById('search-card-form');
    this.cardDisplay = document.getElementById('card-display');
    // FORM INPUTS
    this.nameInput = document.getElementById('name-input');
    this.cardTypeList = document.getElementById('type-list');
    this.cmcInput = document.getElementById('cmc-input');
    this.powerInput = document.getElementById('power-input');
    this.toughnessInput = document.getElementById('toughness-input');
    this.whiteCheckbox = document.getElementById('white-checkbox');
    this.blueCheckbox = document.getElementById('blue-checkbox');
    this.blackCheckbox = document.getElementById('black-checkbox');
    this.redCheckBox = document.getElementById('red-checkbox');
    this.greenCheckbox = document.getElementById('green-checkbox');
    this.hiddenColorIdentityInput = document.getElementById('hidden-color-identity')
    this.allCheckBoxes = this.getAllCheckboxes()
    this.allFieldInputs = this.getAllFieldInputs()
    this.addEventListeners()
  }

  addEventListeners() {
    console.log('event listeners loaded');
    this.searchCardEventListener()
    this.colorIdentityEventListener()
  }

  searchCardEventListener() {
    this.cardSearchForm.addEventListener("submit", event => {
      event.preventDefault()
      this.searchCards()
    })
  }

  colorIdentityEventListener() {
    for(let checkbox of this.allCheckBoxes) {
      checkbox.addEventListener("change", () => {
        if (checkbox.checked) {
          this.hiddenColorIdentityInput.value += checkbox.value
        } else {
          this.hiddenColorIdentityInput.value = this.hiddenColorIdentityInput.value.replace(checkbox.value, '')
        }
        this.hiddenColorIdentityInput.value = this.wubrgSort(this.hiddenColorIdentityInput.value)
      })
    }

  }

  wubrgSort(colorIdentity) {
    let sorted = [null, null, null, null]
    for(let c of colorIdentity) {
       if (c === 'W') {
         sorted.splice(0,0, c)
       } else if (c === 'U') {
         sorted.splice(1,0, c)
       } else if (c === 'B') {
         sorted.splice(2,0, c)
       } else if (c === 'R') {
         sorted.splice(3,0, c)
       } else if (c === 'G') {
          sorted.splice(4,0, c)
       }
    }
    sorted = sorted.filter(e => e !== null)
    return sorted.join("")
  }

  searchCards() {
    let options = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
    }
    fetch(`http://localhost:3000/cards?${this.generateSearchParams()}`, options)
      .then(res => res.json())
      .then(json => {
        this.cardDisplay.innerHTML = ""
        for(let card of json) {
          let cardObject = new Card(card)
          this.cardDisplay.innerHTML += cardObject.render()
        }
      })
  }

  getAllCheckboxes() {
    let inputs = document.getElementsByTagName('input')
    let checkboxes = []
    for(let input of inputs) {
      if (input.type === "checkbox") {
        checkboxes.push(input)
      }
    }
    return checkboxes
  }

  getAllFieldInputs() {
    let inputs = document.getElementsByTagName('input')
    let fieldInputs = []
    for(let input of inputs) {
      if (input.type !== "checkbox") {
        fieldInputs.push(input)
      }
    }
    return fieldInputs
  }

  convertCheckboxesToColorIdentity() {
    let colorIdentity = []
    for (let input of this.allCheckBoxes) {
      if (input.checked) {
        colorIdentity.push(input.value)
      }
    }
    if (colorIdentity.length === 0) {
      colorIdentity = null
      return colorIdentity
    } else {
      return colorIdentity.join("")
    }
  }

  generateSearchParams() {
    let params = {}
    for(let input of this.allFieldInputs) {
      if (input.value) {
        params[input.name] = input.value
      }
    }
    if (this.cardTypeList.selectedOptions[0].value !== "") {
      params[this.cardTypeList.name] = this.cardTypeList.selectedOptions[0].value
    }
    let esc = encodeURIComponent;
    let query = Object.keys(params)
        .map(k => esc(k) + '=' + esc(params[k]))
        .join('&');
    return query
  }
}
