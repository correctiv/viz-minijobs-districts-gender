import {introData} from '../scripts/data.js'
import './intro-viz/comparison-piktogram.tag'

<cor-mj-gender-intro class={ getClass('intro-viz') }>

  <comparison-piktogram
    each={ introData }
    title={ title }
    symbol={ symbol }
    unit={ unit }
    labels={ labels }
    data={ data }
    modifier={ modifier }
  />

  this.introData = introData

</cor-mj-gender-intro>
