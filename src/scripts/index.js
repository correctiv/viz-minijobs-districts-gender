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
import {getWindowWidth, getActiveBreakpointFunc} from './responsive.js'
const getActiveBreakpoint = getActiveBreakpointFunc(config.global.breakpoints)
riot.STORE.breakpoint = getActiveBreakpoint(getWindowWidth())
riot.STORE.getActiveBreakpoint = getActiveBreakpoint

// mixins
import getClass from './mixins/class_name.js'
riot.mixin(getClass(config.global.cssNamespace))

// mount app
import '../components/app.tag'
riot.mount('[data-riot-mount="cor-mj-gender-map"]', 'cor-mj-gender-map')
