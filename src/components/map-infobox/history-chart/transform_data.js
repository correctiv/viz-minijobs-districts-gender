import {years} from './date.js'

export default (data, keys) => {
  if (Object.keys(data).length > 0 && keys) {
    return keys.map(k => {
      return {
        id: k,
        values: data[k].split(',').map((d, i) => {
          return {
            year: years[i],
            value: +d
          }
        })
      }
    })
  }
}
