import {durationDataBrd} from '../scripts/data.js'
import './div-bars/grouped-bars-horizontal.tag'
import './intro-viz/duration-piktogram.tag'

<cor-mj-gender-durations class={ getClass('duration-viz') }>

  <duration-piktogram
    each={ introData }
    title={ title }
    symbol={ symbol }
    unit={ unit }
    labels={ labels }
    data={ data }
    width={ width }
    leftovers={ leftovers }
    modifier={ modifier }
  />

  <h3 class={ getClass('duration-viz__headline') }>
    Je länger der Minijob, desto höher der Frauenanteil
  </h3>
  <grouped-bars-horizontal ref='grouped-bars-horizontal'
    groups={ data }
    grouplabel='label'
    labelformat={ labelformat }
    cols={ ['f_rel', 'm_rel'] }
    modifiers={ ['f', 'm'] }
    initlegend={ ['Frauen', 'Männer'] }
    scale=2.5
  />

  this.data = durationDataBrd
  this.introData = [durationDataBrd.intro]
  this.labelformat = v => this._f(v) + ' %'
</cor-mj-gender-durations>
