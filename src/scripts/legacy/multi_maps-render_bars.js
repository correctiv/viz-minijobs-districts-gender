import {TOPICS, COLORS, LABELS} from './config.js'
import renderDivBars from './render_div_bars.js'

// create small bar chart element once
const element = d3.select('#multi-maps-small-bars').append('div')
    .attr('class', 'multi-map__bars-wrapper')
  .append('div')
    .attr('class', 'multi-map__bar-chart')
    .classed('--hidden', true)
    .attr('id', 'multi-map__bar-chart')

element.append('h4')
    .attr('class', 'multi-map__bar-chart-title')
    .text('Verteilung auf die Altersgruppen')
element.append('span')
    .attr('class', 'multi-map__bar-chart-subtitle')

const filterKey = (k, s) => {
  const _s = `${s.split('_')[0]}_`
  return k.indexOf(_s) == 0 && k.indexOf('all') < 0 && k.indexOf('total') < 0
}

const labelKeys = Object.keys(LABELS)
const getOrder = k => labelKeys.indexOf(k)
const getChartData = data => {
  return Object.keys(data).filter(k => filterKey(k, riot.STORE.activeMap)).map((k, i) => {
    return {
      x: k.split('_')[1],
      y: data[k]
    }
  }).sort((a, b) => getOrder(a.x) - getOrder(b.x))
}

export default data => {
  // compute data
  const _data = getChartData(data)

  // update headline
  element.select('span').text(TOPICS[riot.STORE.activeMap])

  if (!riot.STORE.smallBars) {
    riot.STORE.smallBars = true
    // unhide element
    element.classed('--hidden', false)
    // create the bars for the first time
    element.call(el => renderDivBars(el, _data))
        .selectAll('div.divbars__bar')
      .append('span')
        .attr('class', 'multi-map__bar-label')
        .text(d => d.x)

    // add annotation once
    // element.append('p')
    //   .attr('class', 'annotation--small')
    //   .html('Verteilung der Schüler auf die Niveaustufen.<br>0 = keine Niveaustufe erreicht.')
  } else {
    // update bar widths
    element.selectAll('div.divbars__bar').data(_data)
        .style('width', d => `${d.y * 2}%`)  // FIXME
    element.selectAll('span.divbars__bar-label').data(_data)
        .text(d => `${Math.round(d.y)} %`)
  }

}
