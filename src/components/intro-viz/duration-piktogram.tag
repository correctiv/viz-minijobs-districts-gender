import '../div-bars/piktogram/piktogram-bar.tag'
import '../div-bars/piktogram/entypo/entypo-svg.tag'

<duration-piktogram>
  <section class={ _getClass('section') }>
    <piktogram-bar
      ref='piktogram-bar'
      symbol={ opts.symbol }
      css='female'
      modifier={ opts.modifier }
      width={ opts.width }
      count={ opts.data[0] }
      leftovers={ opts.leftovers[0] }
    />
    <piktogram-bar
      ref='piktogram-bar'
      symbol={ opts.symbol }
      css='male'
      modifier={ opts.modifier }
      width={ opts.width }
      count={ opts.data[1] }
      leftovers={ opts.leftovers[1] }
    />

    <section class={ _getClass('legend') }>
      <div class={ _getClass('legend__item', 'inline') }>
        <entypo-svg symbol={ opts.symbol } class={ _getClass('legend__entypo-svg') }/>
        { opts.unit }
      </div>
      <div class={ _getClass('legend__item', 'inline') } each={ d, i in opts.data }>
        <span class="{ _getClass('legend__item-square') } -bg--{ ['f', 'm'][i] }"></span>
        { parent.opts.labels[i] }
      </div>
    </section>

  </section>

  this._getClass = (c, m) => this.getClass(`intro-viz__${c}`, m)
</duration-piktogram>
