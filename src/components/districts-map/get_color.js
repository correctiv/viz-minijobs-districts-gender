import * as d3 from '../../scripts/lib/d3.js'
// import * as schemes from 'd3-scale-chromatic'

// const colors = ['#ffffcc', '#ffeda0', '#fed976', '#feb24c', '#fd8d3c', '#fc4e2a', '#e31a1c', '#bd0026', '#800026']
// const colors = [ '#ffffd9', '#edf8b1', '#c7e9b4', '#7fcdbb', '#41b6c4', '#1d91c0', '#225ea8', '#253494', '#081d58' ]
// const colors = [ '#fff7fb', '#ece2f0', '#d0d1e6', '#a6bddb', '#67a9cf', '#3690c0', '#02818a', '#016c59', '#014636' ]
// const colors = [ '#ffffe5', '#f7fcb9', '#d9f0a3', '#addd8e', '#78c679', '#41ab5d', '#238443', '#006837', '#004529' ]
// const colors = schemes.schemeRdPu[9]
// const colors = schemes.schemeYlOrBr[9]
// console.log(colors)
const colors = [ '#ffffe5', '#fff7bc', '#fee391', '#fec44f', '#fe9929', '#ec7014', '#cc4c02', '#993404', '#662506' ]
export default d3.scaleQuantile().domain([0, 15]).range(colors)
