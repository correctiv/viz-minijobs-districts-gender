import * as d3 from './lib/d3.js'

// store
// const S = {
//   breakpoint: null,
//   getActiveBreakpoint: null
// }

// event names
const E = {
  updateInfobox: 'uib',
  hideInfobox: 'hib',
  clearResults: 'cr',
  // windowResize: 'wr',
  // breakpointChanged: 'bc',
  hilight: 'hi',
  unhilight: 'uh',
  showSelector: 'ss'
}

// event bus
const C = riot.observable()

// trigger actual breakpoint
// C.on(E.windowResize, width => {
//   const bp = S.getActiveBreakpoint(width)
//   if (S.breakpoint !== bp) {
//     S.breakpoint = bp
//     C.trigger(E.breakpointChanged, bp)
//   }
// })


// make available
// riot.STORE = S
riot.EVT = E
riot.control = C
