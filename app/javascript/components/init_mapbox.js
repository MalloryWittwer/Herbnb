import mapboxgl from "mapbox-gl";

const addMarker = (map, coords) => {
  new mapboxgl.Marker().setLngLat(coords).addTo(map);
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
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v9",
    });
    // Add markers to map:
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      addMarker(map, [marker.lng, marker.lat]);
    });
    // Fit map to markers:
    fitMapToMarkers(map, markers);
  }
};

export { initMapBox };
