import mapboxgl from "mapbox-gl";

const addMarker = (marker, map) => {
  const element = document.createElement("div");
  element.className = "marker";
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = "contain";
  element.style.width = "25px";
  element.style.height = "25px";
  new mapboxgl.Marker(element).setLngLat([marker.lng, marker.lat]).addTo(map);
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
      addMarker(marker, map);
    });
    // Fit map to markers:
    fitMapToMarkers(map, markers);
  }
};

export { initMapBox };
