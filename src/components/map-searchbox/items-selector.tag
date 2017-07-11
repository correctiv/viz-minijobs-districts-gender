import {data} from '../../scripts/data.js'

<items-selector class={ getClass() }>

  <select onchange={ jumpTo }>
    <option each={ item, i in items } value={ i }>{ item.name }</option>
  </select>

  this.items = data.sort((a, b) => a.name > b.name ? 1 : -1)

  this.jumpTo = e => {
    const data = this.items[e.target.value]
    this.parent.jumpTo(data)
  }

</items-selector>
