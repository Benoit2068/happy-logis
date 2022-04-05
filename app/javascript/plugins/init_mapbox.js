
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

// -------------------------Boubacar's code------------------------------------------

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
//   };

//   const addMarkers = (map, markers) => {
//     map.addControl(new mapboxgl.FullscreenControl());
//     markers.forEach((marker) => {
//       const popup = new mapboxgl.Popup().setHTML(marker.info_marker);

//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .setPopup(popup)
//         .addTo(map);
//       });
//     };

//     if (mapElement) { // only build a map if there's a div#map to inject into
//       mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//       const map = new mapboxgl.Map({
//         container: 'map',
//         style: 'mapbox://styles/mapbox/streets-v10'
//       });

//       const markers = JSON.parse(mapElement.dataset.markers);

//       fitMapToMarkers(map, markers);
//       addMarkers(map, markers);
//   }
// };

// export { initMapbox };

// ---------------------------------Ben's Code-----------------------------------------

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
  };

  const addMarkers = (map, markers) => {
    map.addControl(new mapboxgl.FullscreenControl());
    markers.forEach(function (marker, i) {
      const popup = new mapboxgl.Popup().setHTML(marker.info_marker);
      var el = document.createElement('div');
      el.className = 'marker';
      if (markers.length > 1) {
        el.innerHTML = '<span><b>' + (i + 1) + '</b></span>'
      } else {
        el.innerHTML = '<span><b>' + (' ') + '</b></span>'
      }

      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
      });
    };

    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });

      const markers = JSON.parse(mapElement.dataset.markers);

      fitMapToMarkers(map, markers);
      addMarkers(map, markers);
  }
};
export { initMapbox };
