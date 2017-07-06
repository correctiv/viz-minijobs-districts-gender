import * as d3 from '../../scripts/lib/d3.js'
import {geoData} from '../../scripts/data.js'
import getColor from './get_color.js'

export default ({
  element,
  colorCol,
  dataKey,
  getClass,
  gender
}) => {

  const data = geoData
  // const data = geoData[dataKey]
  const path = d3.geoPath().projection(d3.geoMercator().fitSize([600, 800], data))

  return element.append('svg')
      .attr('class', getClass('svg'))
      .attr('preserveAspectRatio', 'xMinYMin meet')
      .attr('viewBox', '0 0 600 800')
    .append('g')
    .selectAll('path').data(data.features).enter().append('path')
      .attr('class', getClass('path'))
      .attr('d', path)
      .attr('fill', d => getColor(+d.properties[`${gender}_main_rel`]))
      .on('mouseover', d => {
        riot.control.trigger(riot.EVT.hilight, d.id)
        riot.control.trigger(riot.EVT.updateInfobox, d.properties)
      })
}
