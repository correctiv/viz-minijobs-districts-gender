import {durationDataBrd} from '../scripts/data.js'
import './div-bars/grouped-bars-horizontal.tag'

<cor-mj-gender-durations class={ getClass('duration-viz') }>

  <comparison-piktogram
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

  <h4 class={ getClass('duration-viz__headline') }>
    Weniger Frauen als Männer machen Minijobs höchstens zwei Jahre lang.
  </h4>
  <grouped-bars-horizontal ref='grouped-bars-horizontal'
    groups={ data.slice(0, 2) }
    grouplabel='label'
    labelformat={ labelformat }
    cols={ ['f_rel', 'm_rel'] }
    modifiers={ ['f', 'm'] }
    initlegend={ ['Frauen', 'Männer'] }
    scale=2.5
  />
  <h4 class={ getClass('duration-viz__headline') }>
    Mehr Frauen als Männer arbeiten länger als zwei Jahre in Minijobs.
  </h4>
  <grouped-bars-horizontal ref='grouped-bars-horizontal'
    groups={ data.slice(2) }
    grouplabel='label'
    labelformat={ labelformat }
    cols={ ['f_rel', 'm_rel'] }
    modifiers={ ['f', 'm'] }
    scale=2.5
  />

  this.data = durationDataBrd
  this.introData = [durationDataBrd.intro]
  this.labelformat = v => this._f(v) + ' %'
</cor-mj-gender-durations>
