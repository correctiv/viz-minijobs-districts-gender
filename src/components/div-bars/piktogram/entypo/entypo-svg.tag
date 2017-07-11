const symbols = {
  man: require('raw!./man.svg'),
  calendar: require('raw!./calendar.svg'),
  user: require('raw!./user.svg')
}

<entypo-svg>

  this.updateContent = () => {
    this.root.innerHTML = symbols[this.opts.symbol]
  }

  this.on('update', () => {
    this.updateContent()
  })

  this.updateContent()
</entypo-svg>
