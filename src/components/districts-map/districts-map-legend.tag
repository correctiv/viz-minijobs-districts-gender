import getColor from './get_color.js'

<districts-map-legend class={ getClass() }>

  <span class={ getClass('annotation') }>Ausschließlich geringfügig Beschäftigte</span>
  <ul class={ getClass('list')}>
    <li each={ ticks } class={ parent.getClass('list-item') }>
      { value }&nbsp;%<span style="background-color:{ color };" />
    </li>
  </ul>

  this.ticks = getColor.quantiles().map(q => {
    return {
      color: getColor(q),
      value: Math.round(q)
    }
  })

</districts-map-legend>
