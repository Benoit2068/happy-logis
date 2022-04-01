
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
  };

  const addMarkers = (map, markers) => {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(
          new mapboxgl.Popup({ offset: 25 }) // add popups
            .setHTML(
              // `<h3>${marker.name}</h3>
              // <p>${marker.address}</p>`
              marker.elements.forEach((element) => {
                `<p>${element.quantity}</p>`;
              })
              )
            // .setHTML(
            //   marker.elements.forEach((element) => {
            //     `<p>${element}</p>`
            //   })
            // )
        )
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



















// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   };
//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10',
//       // center: [11.255, 43.77], // starting position
//       // zoom: 13 // starting zoom
//     });
//     map.addControl(new mapboxgl.FullscreenControl());
//     const markers = JSON.parse(mapElement.dataset.markers);
//     markers.forEach((marker) => {
//     for (const marker of markers) {
//       const el = document.createElement('div');
//       el.className = 'marker';
//       new mapboxgl.Marker(el)
//         .setLngLat([marker.lng, marker.lat])
//         .setPopup(
//             new mapboxgl.Popup({ offset: 25 }) // add popups
//               .setHTML(

//                 `<h3>${marker.name}</h3>
//                 <p>${marker.address}</p>`
//                 // marker.element.forEach((element) => {
//                 //   `${element.quantity}`;
//                 // });
//               )
//           )
//         .addTo(map);
//     fitMapToMarkers(map, markers);
//   }
// export { initMapbox };
