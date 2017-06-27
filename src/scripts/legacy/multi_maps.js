import geoData from './data.js'
import {COLORS, TOPICS} from './config.js'
import addMouseEvents from './add_mouse_events.js'
import getSelectorData from './get_selector_data.js'
import addEvents from './multi_maps-add_events.js'

export default () => {

  // options
  const wrapperId = 'multi-maps'
  const cssNamespace = 'multi-map'
  const legendId = '#multi-maps-legend'
  const infoboxId = '#multi-maps-infobox'
  const selectorId = '#multi-maps-selector'
  const width = 600
  const height = 800
  const yExtent = [0, 15]

  d3.playbooks.choroplethMap.defaults({
    color: COLORS,
    nullColor: '#ededed',
    cssNamespace,
    height,
    width,
    geoData,
    yExtent,
    responsiveSvg: true,
    mouseout: false,
    addMouseEvents,
    getSelectorData,
    getId: f => f.properties.RS
  })

  const maps = {}

  // have some state data globally
  riot.STORE = {
    activeMap: 't_all',
    smallBars: false
  }

  const wrapper = d3.select(`#${wrapperId}`)

  Object.keys(TOPICS).map((s, i) => {
    const elementId = `${wrapperId}--${s}`
    const element = wrapper.append('div')
      .attr('id', elementId)
      .attr('class', 'multi-map__container')
    element.append('h4').attr('class', 'multi-map__title').text(TOPICS[s])
    maps[s] = d3.playbooks.choroplethMap({
      elementId,
      getValue: f => f[`${s}_rel`]
    }).render()

    // render legends/infobox/selector for first iteration
    if (!i) {
      riot.STORE.master = s
      maps[s]
        .infobox({
          element: '#multi-maps-infobox',
          template: `
          <h4 class="mjdm__infobox-title">Minijobber 2015</h4>
          <table class="multi-map__table">
            <tr class="multi-map__table-row multi-map__table-row--header">
              <td>{t_all}</td>
              <td>{f_all}</td>
              <td>{m_all}</td>
            </tr>
            <tr class="multi-map__table-row">
              <td>Gesamt</td>
              <td>Frauen</td>
              <td>Männer</td>
            </tr>
          </table>
          <p class="annotation--small">Einwohner insgesamt: <strong>{t_total}</strong></p>
        `
        })
        .legend({
          wrapperTemplate: `
            <h4 class="multi-map__legend-title">Anteil in&nbsp;%</h4>
            <div class="multi-map__legend-items">
              {body}
            </div>`,
          itemTemplate: '<span class="multi-map__legend-item" style="background-color:{color};">{label}</span>',
          element: '#multi-maps-legend'
        })
        .selector({
          element: '#multi-maps-selector',
          getLabel: f => f.RS
        })
    }

  })

  riot.STORE.maps = maps
  addEvents(maps)


}
