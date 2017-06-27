export default ({g, line, data}) => {
  g.selectAll('.line')
      .data(data)
    .enter().append('path')
      .attr('class', d => `line line--${d.id}`)
      .attr('d', d => line(d.values))
}
