<grouped-bars-horizontal class={ getClass() }>

  <div each={ groups } class={ getClass('group')}>
    <div class={ getClass('group__label') }>
      <span>{ label }</span>
    </div>
    <div class={ getClass('bars-container') }>
      <div each={ bars }
        class="{ getClass('bar') } { getClass('bar') }--{ modifier }"
        style='width:{ width }%;'>
        <span if={ legend } class={ getClass('bar__legend') }>{ legend }</span>
        <span class={ getClass('bar__label') }>{ label }</span>
      </div>
    </div>
    <span class='-clear-' />
  </div>

  this.groups = this.opts.groups.map((g, i) => {
    return {
      label: g[this.opts.grouplabel],
      bars: this.opts.cols.map((c, j) => {
        const value = g[c]
        return {
          width: value * this.opts.scale,
          label: this.opts.labelformat(value),
          modifier: this.opts.modifiers[j],
          legend: !i && this.opts.initlegend ?
            this.opts.initlegend[j] : null
        }
      })
    }
  })

</grouped-bars-horizontal>
