import './entypo/entypo-svg.tag'

<piktogram-bar class={ _getClass() }>
  <entypo-svg
    each={ piktos }
    symbol={ parent.opts.symbol }
    class={ parent._cssClass }
    style='width:{ parent.opts.width }%;'
  />
  <entypo-svg
    each={ leftovers }
    symbol={ parent.opts.symbol }
    class="{ parent._css } { parent._css }--leftover"
    style='width:{ parent.opts.width }%;'
  />

  this.piktos = Array(+this.opts.count).map(() => 0)
  this.leftovers = Array(+this.opts.leftovers).map(() => 0)
  this._css = this.getClass('pikto')
  this._cssClass = `${this._css} ${this._css}--${ this.opts.css }`
  this._getClass = () => {
    const klass = this.getClass()
    const mod = this.opts.modifier
    return mod ? `${klass} ${klass}--${mod}` : klass
  }
</piktogram-bar>
