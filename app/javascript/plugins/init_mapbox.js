
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';



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

// -------------------------------------------------------------

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');
//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10',
//       center: [11.255, 43.77], // starting position
//       zoom: 13 // starting zoom
//     });
//     map.addControl(new mapboxgl.FullscreenControl());
//     const markers = JSON.parse(mapElement.dataset.markers);

//     for (const marker of markers) {
//       // Create a DOM element for each marker.
//       const popup = new mapboxgl.Popup().setHTML(marker.info_marker);
//       const el = document.createElement('div');
//       el.className = 'marker';
//       // el.innerHTML = '<span><b>' + (i + 1) + '</b></span>'
//       // Add markers to the map.
//       new mapboxgl.Marker(el)
//         .setLngLat([marker.lng, marker.lat])
//         .setPopup(popup)
//         .addTo(map);
//     }
//     const fitMapToMarkers = (map, markers) => {
//       const bounds = new mapboxgl.LngLatBounds();
//       markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//       map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//     };
//     fitMapToMarkers(map, markers);
//     //}
//   }
// };
// export { initMapbox };


// ---------------Test_number_in marker--------------------------
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
