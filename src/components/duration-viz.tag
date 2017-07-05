import * as d3 from '../scripts/lib/d3.js'
import {durationDataBrd} from '../scripts/data.js'
import colors from './div-bars/get_gender_bars_colors.js'
import './div-bars/bar-tooltip.tag'

<cor-mj-gender-durations class={ getClass('duration-viz-brd') }>

  <div class="multi-bars__table">
    <div each={ bars } class="multi-bars__row">
      <div class="multi-bars__cell multi-bars__cell--label">
        <strong>{ name }</strong><br>
          <span class="annotation">{ sumAbsolute } insgesamt</span>
      </div>
      <div class="multi-bars__chart">
        <div each={ bars }
          onclick={ _onClick }
          class="multi-bars__bar multi-bars__bar--{ modifier }"
          style="width:{ width }%;background-color:{ color };">
          <div class="multi-bars__bar-label { _getClass(width * 2) }">{ label }</div>
        </div>
      </div>
    </div>
  </div>

  this.keys = ['f', 'm']
  this.labels = ['Frauen', 'Männer']
  this.bars = this.keys.map((k, i) => {
    const name = this.labels[i]
    const sumAbsolute = d3.sum(durationDataBrd.map(r => +r[k]))
    const sum = d3.sum(durationDataBrd.map(r => +r[`${k}_rel`]))
    const bars = durationDataBrd.map((r, i) => {
      const width = +r[`${k}_rel`] / sum * 100
      return {
        width,
        modifier: k,
        color: colors[i+1],
        label: i < 3 ? r.label : i < 5 ? `${i} - ${i+1}` : ''
      }
    }).sort((a, b) => +b.ordering - +a.ordering)
    return {name, bars, sumAbsolute}
  })

  this._getClass = width => {
    return width < 10 ? '--hide-md' : width < 15 ? '--hide-sm' : ''
  }

  this._onClick = ({item, x, y}) => {
    // this.update({
    //   toolti
    // })
  }


</cor-mj-gender-durations>
