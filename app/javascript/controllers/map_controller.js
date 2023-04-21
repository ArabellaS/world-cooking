import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String, markers: Array }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const projection = 'mercator'
    this.map = new mapboxgl.Map({
      container: this.element,
      projection: projection,
      center: [52.528594, -23.493070],
      zoom: 1,
      scrollZoom: true,
      style: "mapbox://styles/ceciles/clepszwio008w01pjarafjp5i"
    })

    this.map.setRenderWorldCopies(false)
    this.map.dragRotate.disable();

    this.map.touchZoomRotate.disableRotation();
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.on('click', 'circle', (e) => {
      this.map.flyTo({
      center: e.features[0].geometry.coordinates
      });
    });
  }

  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
