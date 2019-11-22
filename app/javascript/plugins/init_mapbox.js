import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

        // const element = document.createElement('div');
        //   element.className = 'marker';
        //   element.style.backgroundImage = `url('https://lh3.googleusercontent.com/ie_u_0NkC5roA7aCD8AAJv3ImkukzgGPn5dPLHNXHRy8ZTINOJ8L4TRk-WNX2Ln5OvN8N0toEujPk_zIsexciI5R5HG7q5fIXo4LD6fhn5AFjqW_epKM-r58rgqhdtHdK6VBsWFQihjdj0PxQ9axTPmQEkXIp4Y6Ei_0ti3vcgjbdAz_TUUNnVgu63fThlTw4ph45rk-dT-M2SzuuK72g_-CHRFWbve1I-TiOK_hRa6A0BOiCDuQC1ovz7Gxj6zEIkDTWaJOqm1pk6Ci4zkppiYby0dPkE_4a7Y_1pbeqT-nMM-CFEISSTOFJrqj3HisEXLNfGLq_yALuER6DUybjQoVpM-hLCIQ1_5-f4YJTbklk8TBc0XSH0sdHb8rmWkIg2AgWmrzv5P8tExs2d_2bogzJBKyslYOfi-T8bR9JmWmtzsjwKYPvn_6Pj3LlOm6Opld3-veqS3H6Z1-TbIUyCf8OAtl6e1crsEf-TXhisI3cfFgllOuneVqXS_-79yYvgOlOt6tmmiBCX6b7xLqwJYPXXfnMa4S09TazIOFbhvFn2Jbv9mkBcAGv-AL9dSeNtiwle8wT1F0j14EEG9wCkkLYhzBgMKfvHAwgzjY2bieUNqfSNtyK9y8jwivvCOWXCaC-dCBPLeXsgzhsGSx6-Obsu4UykF_seZS5TdjbVfHrYEART03leqT=s512-no')`;
        //   element.style.backgroundSize = 'contain';
        //   element.style.width = '25px';
        //   element.style.height = '25px';
        //   element.style.color = "red";

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
           .setPopup(popup) // add this
          .addTo(map);
      });
    // addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }


};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

export { initMapbox };

