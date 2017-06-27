import * as d3 from '../../../scripts/lib/d3.js'

const formatDate = d3.timeFormat('%Y')
const parseDate = d3.timeParse('%Y')
const toDate = str => parseDate(str)

module.exports = {
  fromDate: date => formatDate(date),
  convertDate: str => formatDate(parseDate(str)),
  toDate,
  years: [
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016"
  ].map(y => toDate(y))
}
