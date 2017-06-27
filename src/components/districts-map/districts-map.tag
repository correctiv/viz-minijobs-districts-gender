import * as d3 from '../../scripts/lib/d3.js'
import renderMap from './render_map.js'
import hilight from './hilight_path.js'
import unhilight from './unhilight_path.js'

<districts-map class="{ getClass() } { getClass() }--{ opts.gender }">

  <h3 class={ getClass('title') }>{ titles[opts.gender] }</h3>
  <span class={ getClass('subtitle') }>von 25 bis 65 Jahre</span>
  <div class={ getClass('svg-wrapper') } id="svg-map-{ opts.gender }" />

  this.titles = {
    f: 'Frauen',
    m: 'Männer'
  }

  this.on('mount', () => {
    this.selection = renderMap({
      element: d3.select(`#svg-map-${this.opts.gender}`),
      gender: this.opts.gender,
      getClass: this.getClass
    })
  })

  riot.control.on(riot.EVT.hilight, id => this.hilighted = hilight(this.selection, id, this.hilighted))
  riot.control.on(riot.EVT.unhilight, () => unhilight(this.hilighted))

</districts-map>
