import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    fly: Boolean
  }


  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    console.log(this.markersValue)

    if(this.flyValue) {
      this.options = {
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10",
        center: [this.markersValue[0].lng + 20, this.markersValue[0].lat + 20], // starting position [lng, lat]
        zoom: 5 // starting zoom
      }
    } else {
      this.options = {
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10",
      }
    }
    this.map = new mapboxgl.Map(this.options)

    console.log("test")
    this.#addMarkersToMap()
    if(!this.flyValue) {
      this.#fitMapToMarkers()
    }
    // this.map.flyTo({
    //   center: [(Math.random() - 0.5) * 360, (Math.random() - 0.5) * 100],
    //   essential: true // this animation is considered essential with respect to prefers-reduced-motion
    //   })

  };

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"


      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)

      console.log(this.flyValue);

      if(this.flyValue) {
        this.map.flyTo({
          center: [marker.lng, marker.lat],
          essential: true // this animation is considered essential with respect to prefers-reduced-motion
          });
      }
    })
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 10, maxZoom: 22, duration: 0 });
  };
};
