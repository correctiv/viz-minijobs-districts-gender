export default ({g, line, data}) => {
  g.selectAll('path.line')
      .data(data)
      .attr('class', d => `line line--${d.id}`)
      .attr('d', d => line(d.values))
}
