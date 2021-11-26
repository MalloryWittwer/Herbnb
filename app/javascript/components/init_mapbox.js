import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const addMarker = (marker, map) => {
  // Popup info window:
  const popup = new mapboxgl.Popup().setHTML(marker.info_window);
  // Custom marker style:
  const element = document.createElement("div");
  element.className = "marker";
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = "contain";
  element.style.width = "30px";
  element.style.height = "30px";
  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapBox = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    const apiKey = mapElement.dataset.mapboxKey;
    mapboxgl.accessToken = apiKey;
    console.log("Creating map...");
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v9",
    });
    map.on("load", () => {
      map.resize();
      // Add markers to map:
      console.log("Adding markers to map...");
      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        addMarker(marker, map);
      });
      // Fit map to markers:
      console.log("Fittig map to markers...");
      fitMapToMarkers(map, markers);
    });
  }
};

export { initMapBox };
