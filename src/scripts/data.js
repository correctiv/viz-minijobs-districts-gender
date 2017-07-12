import * as topojson from 'topojson'
import * as d3 from './lib/d3.js'

const geoSrc = require('json!../data/landkreise_simplify200.topo.json')
const geoData = topojson.feature(geoSrc, geoSrc.objects.landkreise_simplify200)

const states = require('json!../data/states.json')
const data = d3.csvParse(require('raw!../data/gender_main_group.csv'))

const search = str => data.filter(d => d.name.toLowerCase().indexOf(str) > -1)

const durationDataBrd = d3.csvParse(require('raw!../data/brd-durations.csv'))
durationDataBrd.intro = require('json!../data/intro_duration.json')

const introData = require('json!../data/intro.json')

geoData.features.map(f => {
  f.id = f.properties.RS
  const _data = data.find(d => d.id === f.id)
  if (_data) {
    _data.state = states[_data.s_id]
    _data.fRatio = Math.round(_data.f_total_pop / _data.t_total_pop * 1000) / 10
    f.properties = _data
  } else f.__data_missing__ = true
})

module.exports = {
  geoData,
  data,
  search,
  durationDataBrd,
  introData,
}

