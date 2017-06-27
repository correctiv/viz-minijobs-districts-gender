import * as d3 from '../../../scripts/lib/d3.js'
import {toDate} from './date.js'

export default ({
  element,
  getClass
}, {
  width,
  height,
  margin,
  xExtent,
  yExtent,
  yTickValues
}) => {
  const x = d3.scaleTime().rangeRound([0, width])
    .domain([toDate(xExtent[0]), toDate(xExtent[1])])
  const y = d3.scaleLinear().rangeRound([height, 0])
    .domain(yExtent)

  const line = d3.line()
    .x(d => x(d.year))
    .y(d => y(d.value))
    .defined(d => !isNaN(d.value))
    // .curve(d3.curveStep())

  const {top, right, bottom, left} = margin

  const g = d3.select(element).append('svg')
      .attr('preserveAspectRatio', 'xMinYMin meet')
      .attr('viewBox', `0 0 ${width + left + right} ${height + top + bottom}`)
      .attr('class', getClass('svg'))
    .append('g')
      .attr('transform', `translate(${margin.left},${margin.top})`)

  g.append('g')
      .attr('class', 'axis axis--x')
      .attr('transform', 'translate(0,' + height + ')')
      .call(d3.axisBottom(x).ticks(6))

  g.append('g')
      .attr('class', 'axis axis--y')
      .call(d3.axisLeft(y).tickValues(yTickValues))
    .append('text')
      .attr('transform', 'rotate(-90)')
      .attr('y', 6)
      .attr('dy', '0.71em')
      .style('text-anchor', 'end')
      .text('Anteil in %')

  return {g, line}
}
