import './intro-viz/comparison-piktogram.tag'

<cor-mj-gender-intro class={ getClass('intro-viz') }>

  <comparison-piktogram
    symbol={ data.symbol }
    unit={ data.unit }
    labels={ data.labels }
    data={ data.data }
    width={ data.width }
    leftovers={ data.leftovers }
    modifier={ data.modifier }
  />

  this.data = {
    "data": [210, 88],
    "symbol": "man",
    "leftovers": [257, 221],
    "unit": "alle Minijobber. Eine Figur entspricht 10.000 Menschen",
    "labels": ["2.104.393 Frauen", "879.207 M\u00e4nner"],
    "width": 2.5
  }

</cor-mj-gender-intro>
