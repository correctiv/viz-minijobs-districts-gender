import './districts-map/districts-map.tag'
import './map-infobox/map-infobox.tag'
import './map-searchbox/map-searchbox.tag'

<cor-mj-gender-map class={ getClass('app-container') }>
  <map-searchbox ref='searchbox' />
  <map-infobox ref='infobox' />
  <section class={ getClass('districts-map-container') }>
    <districts-map ref='districts-map' gender='f' />
    <districts-map ref='districts-map' gender='m' />
  </section>
</cor-mj-gender-map>
