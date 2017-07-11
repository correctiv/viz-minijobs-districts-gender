import '../div-bars/piktogram/piktogram-bar.tag'
import '../div-bars/piktogram/entypo/entypo-svg.tag'

<comparison-piktogram>

  <section class={ _getClass('section') }>

    <h3>{ opts.title }</h3>

    <piktogram-bar
      ref='piktogram-bar'
      symbol={ opts.symbol }
      css='female'
      modifier={ opts.modifier }
      width={ opts.data[1] }
      count={ opts.data[0][0] } />
    <piktogram-bar
      ref='piktogram-bar'
      symbol={ opts.symbol }
      css='male'
      modifier={ opts.modifier }
      width={ opts.data[1] }
      count={ opts.data[0][1] } />

    <section class={ _getClass('legend') }>
      <div class={ _getClass('legend__item') }>
        <entypo-svg symbol={ opts.symbol } class={ _getClass('legend__entypo-svg') }/>
        { opts.unit }
      </div>
      <div class={ _getClass('legend__item') } each={ d, i in opts.data[0] }>
        <span class="{ _getClass('legend__item-square') } -bg--{ ['f', 'm'][i] }"></span>
        { parent.opts.labels[i] }
      </div>
    </section>

  </section>

  this._getClass = c => this.getClass(`intro-viz__${c}`)
</comparison-piktogram>
