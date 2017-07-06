<grouped-bars class={ getClass() }>

  <div each={ groups } class={ getClass('group')} style='width:{ width }%;'>
    <div class={ getClass('bars-container') }>
      <div each={ bars }
        class={ getClass('bar-outer') }
        style='left:{ left }%;width:{ width }%;height:{ height }%;'>
        <div class="{ getClass('bar') } { getClass('bar') }--{ modifier }">
          <span class={ getClass('bar__label') }>{ label }</span>
        </div>
      </div>
      <div class={ getClass('group__label') }>
        <span>{ label }</span>
      </div>
    </div>
  </div>

  this.groups = this.opts.groups.map(g => {
    return {
      label: g[this.opts.grouplabel],
      width: 100 / this.opts.groups.length,
      bars: this.opts.cols.map((c, i) => {
        const width = 100 / this.opts.cols.length
        const value = g[c]
        return {
          height: value * this.opts.scale,
          width,
          left: width * i,
          label: this.opts.labelformat(value),
          modifier: this.opts.modifiers[i]
        }
      })
    }
  })

</grouped-bars>
