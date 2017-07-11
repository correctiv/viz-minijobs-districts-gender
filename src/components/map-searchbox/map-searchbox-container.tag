import './items-selector.tag'
import './map-searchbox.tag'

<map-searchbox-container class={ getClass() }>

<items-selector ref='selector' if={ showSelector } />
<map-searchbox ref='searchbox' if={ showSearchbox } />

<span class={ getClass('selector-toggle') } onclick={ toggleSelector }>{ getToggleText() }</a>

  this.showSelector = false
  this.showSearchbox = true
  this.toggleSelector = () => this.update({
    showSelector: !this.showSelector,
    showSearchbox: !this.showSearchbox
  })

  this.jumpTo = data => {
    riot.control.trigger(riot.EVT.updateInfobox, data)
    riot.control.trigger(riot.EVT.hilight, data.id)
  }

  this.getToggleText = () => this.showSearchbox ? 'Wähle aus einer Liste aus' : 'Benutze die Suche'

</map-searchbox-container>
