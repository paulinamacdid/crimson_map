import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map-large"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  static targets = ["filtersForm"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.options = {
      enableHighAccuracy: false,
      timeout: 5000,
      maximumAge: 0,
    };

    this.map = new mapboxgl.Map({
      container: "map-large", // this.element,
      style: "mapbox://styles/dorothea87/cm2c313mb009601pggw8k4fo2",
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    // this.#filterButton();
    // this.#addFilter();
    // this.#removeFilter();
    // this.map.addControl(
    //   new MapboxGeocoder({
    //     accessToken: mapboxgl.accessToken,
    //     mapboxgl: mapboxgl,
    //   })
    // );

    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true,
      },
      trackUserLocation: true,
      showUserHeading: true,
    });
    this.map.addControl(geoLocate);
  }

  // triggered with click data-action on show page attached to the navigate to here button
  navigateRoute() {
    console.log("clicked!");

    navigator.geolocation.getCurrentPosition(
      this.success.bind(this),
      this.error,
      this.options
    );
  }

  success(pos) {
    // this function is triggered when current position is successfully called
    console.log("start lat", pos.coords.latitude);
    console.log("start long", pos.coords.longitude);
    // sending the start position coordinates (current location) to the get route function
    this.getRoute(pos);
  }

  getRoute(pos) {
    const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${pos.coords.longitude},${pos.coords.latitude};${this.markersValue[0].lng},${this.markersValue[0].lat}?geometries=geojson&access_token=${this.apiKeyValue}`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        const route = data.routes[0].geometry.coordinates;
        const geojson = {
          type: "Feature",
          properties: {},
          geometry: {
            type: "LineString",
            coordinates: route,
          },
        };

        // if the route already exists on the map, we'll reset it using setData
        if (this.map.getSource("route")) {
          this.map.getSource("route").setData(geojson);
        }
        // otherwise, we'll make a new request
        else {
          this.map.addLayer({
            id: "route",
            type: "line",
            source: {
              type: "geojson",
              data: geojson,
            },
            layout: {
              "line-join": "round",
              "line-cap": "round",
            },
            paint: {
              "line-color": "#3887be",
              "line-width": 5,
              "line-opacity": 0.75,
            },
          });
        }
        // add turn instructions here at the end

        // this.map.on('load', () => {
        //   // make an initial directions request that
        //   // starts and ends at the same location
        //   this.getRoute(start);

        //   // Add starting point to the map
        //   this.map.addLayer({
        //     id: 'point',
        //     type: 'circle',
        //     source: {
        //       type: 'geojson',
        //       data: {
        //         type: 'FeatureCollection',
        //         features: [
        //           {
        //             type: 'Feature',
        //             properties: {},
        //             geometry: {
        //               type: 'Point',
        //               coordinates: start
        //             }
        //           }
        //         ]
        //       }
        //     },
        //     paint: {
        //       'circle-radius': 10,
        //       'circle-color': '#3887be'
        //     }
        //   });
        // });
        // reshaping map to fit the bounds of the route
        this.map.fitBounds(
          [
            [pos.coords.longitude, pos.coords.latitude], // southwestern corner of the bounds
            [this.markersValue[0].lng, this.markersValue[0].lat], // northeastern corner of the bounds
          ],
          {
            padding: 75, // padding in pixels
          }
        );
      });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
