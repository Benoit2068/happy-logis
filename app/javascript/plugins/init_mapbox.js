
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
    map.on('load', () => {
      // Load an image from an external URL.
      map.loadImage(
        'file:///Users/boubacar/code/Boubacar-K94/happy-logis/app/assets/images/logo.png',
        (error, image) => {
          if (error) throw error;

          // Add the image to the map style.
          map.addImage('logo', image);

          // Add a data source containing one point feature.
          map.addSource('point', {
            'type': 'geojson',
            'data': {
              'type': 'FeatureCollection',
              'features': [
                {
                  'type': 'Feature',
                  'geometry': {
                    'type': 'Point',
                    'coordinates': [46.61629, 6.62540]
                  }
                }
              ]
            }
          });

          // Add a layer to use the image to represent the data.
          map.addLayer({
            'id': 'points',
            'type': 'symbol',
            'source': 'point', // reference the data source
            'layout': {
              'icon-image': 'logo', // reference the image
              'icon-size': 0.25
            }
          });
        }
      );
    });

    map.on('load', () => {
      map.addLayer({
        id: 'terrain-data',
        type: 'line',
        source: {
          type: 'vector',
          url: 'mapbox://mapbox.mapbox-terrain-v2'
        },
        'source-layer': 'contour'
      });
    });




    const popup = new mapboxgl.Popup({ closeOnClick: false })
      .setLngLat([7.36, 46.26])
      .setHTML('<h1>you have 5 loadings</h1>')
      .addTo(map);

    //if (markers.length > 0) {
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      });



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
