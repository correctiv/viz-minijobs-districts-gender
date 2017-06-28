// compare values with an overall sum of 100%

import * as d3 from '../../scripts/lib/d3.js'

<comparison-full-bar class={ getClass() }>

  <div
    each={ values }
    class="{ getClass('bar') } { getClass('bar') }--{ modifier }"
    style="width:{ width }%;">
    <span if={ !parent.opts.nolabels }
      class="{ getClass('bar__label') } { getClass('bar__label')}--{ modifier }">{ label }</span>
  </div>

  this.draw = () => {
    this.sum = d3.sum(this.opts.values.map(v => v.value))
    this.values = this.opts.values.map(v => {
      return {
        width: v.value / this.sum * 100,
        label: v.label || v.modifier || v.value,
        modifier: v.modifier || v.label
      }
    })
  }

  this.draw()
  this.on('update', () => this.draw())

</comparison-full-bar>
