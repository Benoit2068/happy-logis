
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [11.255, 43.77], // starting position
      zoom: 13 // starting zoom

    });



    map.addControl(new mapboxgl.FullscreenControl());

    const markers = JSON.parse(mapElement.dataset.markers);




    //const popup = new mapboxgl.Popup({ closeOnClick: false })
    // .setLngLat([7.36, 46.26])
    //.setHTML('<h1>you have 5 loadings</h1>')
    //.addTo(map);

    //if (markers.length > 0) {
    // markers.forEach((marker) => {
    // new mapboxgl.Marker()
    //  .setLngLat([marker.lng, marker.lat])
    //  .setPopup(
    //   new mapboxgl.Popup({ offset: 25 }) // add popups
    //     .setHTML(
    //      `<h3>test</h3>`
    //    )
    // )
    //.addTo(map);
    //});

    // Add markers to the map.
    for (const marker of markers) {
      // Create a DOM element for each marker.
      const el = document.createElement('div');

      el.className = 'marker';



      // Add markers to the map.
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(
          new mapboxgl.Popup({ offset: 25 }) // add popups
            .setHTML(
              `<h3>test</h3>`
            )
        )
        .addTo(map);
    }



    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };

    fitMapToMarkers(map, markers);

    //}


  }
};

export { initMapbox };
