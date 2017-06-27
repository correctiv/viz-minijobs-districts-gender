/*
 * utils for responsive handling of this visualization.
 *
 */

const getWindowWidth = () => {
  const w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0]
    return w.innerWidth || e.clientWidth || g.clientWidth
}

// FIXME where to do this!?
let timeout
const doResize = () => riot.control.trigger(riot.EVT.windowResize, getWindowWidth())
window.onresize = e => {
  clearTimeout(timeout)
  timeout = setTimeout(doResize, 100)
}

/*
 * get function for getting active breakpoint based on given `width`
 */
const getActiveBreakpointFunc = breakpoints => {
  let bp = []
  for (let name in breakpoints) {
    let value = breakpoints[name]
    bp.push({name, value})
  }
  bp = bp.sort((a, b) => a.value - b.value)
  const lg = bp[bp.length-1]  // largest breakpoint as fallback
  return width => width <= lg.value ? bp.find(el => el.value >= width).name : lg.name
}

module.exports = {
  getActiveBreakpointFunc,
  getWindowWidth
}
