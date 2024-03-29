import '../div-bars/comparison-full-bar.tag'

<map-infobox if={ data } class="{ getClass() } { -visible: visible }">

  <button class={ getClass('close-btn') } aria-label='Close' onclick={ close }></button>

  <header class={ getClass('header') }>
    <section class={ getClass('header__section') }>
      <span class={ getClass('state') }>{ data.state }</span>
      <h3 class={ getClass('title') }>{ data.name }</h3>
    </section>
    <section class={ getClass('header__section') }>
      <span class={ getClass('population') }><strong>{ _f(data.t_total_pop) }</strong>&nbsp;Einwohner</span>
      <span class={ getClass('f-ratio') }>davon <strong>{ _f(data.fRatio) }&nbsp;%</strong>&nbsp;Frauen</span>
    </section>
    <span class="-clear-"></span>
  </header>

  <section class={ getClass('section') }>
    <h4 class={ getClass('section__title') }>Anteil Minijobber</h4>
    <p class={ getClass('annotation') }>Von allen 25- bis 65-Jährigen des jeweiligen Geschlechts gehen einer <strong>ausschließlich</strong> geringfügigen Beschäftigung nach:</p>
    <dl>
      <dt>{ _f(data.f_main_rel) }&nbsp;%</dt>
      <dt class="-small">{ _f(data.f_main) }</dt>
      <dd class="badge badge--f">Frauen</dd>
    </dl>
    <dl>
      <dt>{ _f(data.m_main_rel) }&nbsp;%</dt>
      <dt class="-small">{ _f(data.m_main) }</dt>
      <dd class="badge badge--m">Männer</dd>
    </dl>
    <dl>
      <dt>{ _f(data.t_main_rel) }&nbsp;%</dt>
      <dt class="-small">{ _f(data.t_main) }</dt>
      <dd class="badge badge--t">Gesamt</dd>
    </dl>
    <span class="-clear-"></span>
  </section>
  <section class={ getClass('section') }>
    <h4 class={ getClass('section__title') }>Verhältnis W/M</h4>
    <comparison-full-bar
      if={ barData }
      ref='comparison-full-bar'
      nolabels={ true }
      values={ barData } />
    <span class="-clear-"></span>
  </section>

  this.visible = false
  this.data = {}

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({
      data,
      barData: this.getBarData(data),
      visible: true
    })
  })

  riot.control.on(riot.EVT.hideInfobox, () => {
    this.update({visible: false})
  })

  this.close = () => this.update({visible: false})

  this.getBarData = data => {
    const cols = ['f_main', 'm_main']
    const labels = ['Frauen', 'Männer']
    const modifiers = ['f', 'm']
    return cols.map((c, i) => {
      return {
        value: data[c],
        label: labels[i],
        modifier: modifiers[i]
      }
    })
  }

</map-infobox>
