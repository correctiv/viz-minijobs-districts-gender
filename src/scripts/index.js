'use strict'

if (module.hot) {
  module.hot.accept()
}

// import 'babel-polyfill'
import '../styles/index.scss'

// event bus
import './riot_event_bus.js'

// config
const config = require('json!../config.json')

// setup responsiveness
// import {getWindowWidth, getActiveBreakpointFunc} from './responsive.js'
// const getActiveBreakpoint = getActiveBreakpointFunc(config.global.breakpoints)
// riot.STORE.breakpoint = getActiveBreakpoint(getWindowWidth())
// riot.STORE.getActiveBreakpoint = getActiveBreakpoint

// mixins
import getClass from './mixins/class_name.js'
import numberFormat from './mixins/number_format.js'
riot.mixin(getClass(config.global.cssNamespace))
riot.mixin(numberFormat)

// mount vizes
import '../components/districts-gender-map.tag'
import '../components/duration-viz.tag'
import '../components/intro-viz.tag'
import {select} from './lib/d3.js'

const mount = (name) => {
  const selector = `[data-riot-mount="${name}"]`
  select(selector).node() && riot.mount(selector, name)
}

mount('cor-mj-gender-durations')
mount('cor-mj-gender-map')
mount('cor-mj-gender-intro')
