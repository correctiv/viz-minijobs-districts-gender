import {search} from '../../scripts/data.js'

<map-searchbox class={ getClass() }>

  <section class={ getClass('input-wrapper') }>
    <input type="text"
      oninput={ doSearch } class={ getClass('input') }
      placeholder="Suche nach Deinem Landkreis..." />
  </section>

  <ul if={ results.length } class={ getClass('result-list') }>
    <li each={ results }
      class={ parent.getClass('result-list__item') }
      onclick={ handleClick }>
      { name }<span>{ state }</span>
    </li>
  </ul>

  this.results = []

  this.doSearch = e => {
    riot.control.trigger(riot.EVT.hideInfobox)
    const str = e.target.value.toLowerCase()
    if (str.length > 2) this.update({results: search(str)})
    else this.clearResults()
  }

  this.handleClick = e => {
    this.clearResults()
    this.parent.jumpTo(e.item)
  }

  this.clearResults = () => {
    this.update({results: []})
  }

  riot.control.on(riot.EVT.clearResults, () => {
    this.clearResults()
  })

</map-searchbox>
