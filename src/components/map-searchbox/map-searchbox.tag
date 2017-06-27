import './items-selector.tag'
import {search} from '../../scripts/data.js'

<map-searchbox class={ getClass() }>

  <section class={ getClass('input-wrapper') }>
    <input type="text"
      oninput={ doSearch } class={ getClass('input') }
      placeholder="Suche nach Deinem Landkreis..." />
    <button class="btn { getClass('selector-button') }"
      onclick={ toggleSelector }>{ selectorVisible ? 'Suche' : 'Auswahl' }</button>
  </section>
  <items-selector ref='selector' visible={ selectorVisible } />

  <ul if={ results.length } class={ getClass('result-list') }>
    <li each={ results }
      class={ parent.getClass('result-list__item') }
      onclick={ handleClick }>
      { name }
    </li>
  </ul>

  this.results = []

  this.doSearch = e => {
    riot.control.trigger(riot.EVT.hideInfobox)
    const str = e.target.value.toLowerCase()
    if (str.length > 2) {
      const results = search(str)
      if (results.length === 1) {
        this.clearResults()
        this.jumpTo(results[0])
      } else {
        this.update({results})
      }
    } else {
      this.clearResults()
    }
  }

  this.handleClick = e => {
    this.clearResults()
    this.jumpTo(e.item)
  }

  this.clearResults = () => {
    this.update({results: []})
  }

  riot.control.on(riot.EVT.clearResults, () => {
    this.clearResults()
  })

  this.jumpTo = data => {
    riot.control.trigger(riot.EVT.updateInfobox, data)
    riot.control.trigger(riot.EVT.hilight, data.id)
  }

  this.toggleSelector = () => this.update({selectorVisible: !this.selectorVisible})

</map-searchbox>
