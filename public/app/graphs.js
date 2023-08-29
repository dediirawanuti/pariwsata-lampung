var key =
  "pk.eyJ1IjoicmluZ2dvMDciLCJhIjoiY2t4MHB2ZjJ0MHV3YzJycHo0OHhzZGIwOSJ9.odEp1QZ9gCcw9biNi2j6Tg";
var defaultLocation = [105.2625, -5.42944];

mapboxgl.accessToken = key;

var currentMarkers = [];
var currentMarkersGeocoder = [];

// Initial Map
var map = new mapboxgl.Map({
  container: "map",
  style: "mapbox://styles/mapbox/streets-v11",
  center: [105.2625, -5.42944],
  zoom: 8.5,
  attributionControl: false,
});

// Search box
const geocoder = new MapboxGeocoder({
  mapboxgl: mapboxgl,
  accessToken: mapboxgl.accessToken,
  marker: false,
  placeholder: 'Tentukan lokasi anda'
});

geocoder.on("result", (e) => {
  if (currentMarkersGeocoder !== null) {
    for (var i = currentMarkersGeocoder.length - 1; i >= 0; i--) {
      currentMarkersGeocoder[i].remove();
    }
  }

  const marker = new mapboxgl.Marker({
    draggable: true,
    color: "green",
  })
    .setLngLat(e.result.center)
    .addTo(map);

  var popup = new mapboxgl.Popup();
  popup.setHTML(`
        <div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
            <h5 style="color: black">Lokasi kamu sekarang !</h5>
            <img src="`+ base_url + `/writable/images/maps/myLocation.png" class="img-fluid">
        </div>
        `);
  marker.setPopup(popup);

  currentMarkersGeocoder.push(marker);

  marker.on("dragend", function (e) {
    var lngLat = e.target.getLngLat();
    document.getElementById("lat").value = lngLat.lat;
    document.getElementById("lng").value = lngLat.lng;
  });
});

map.addControl(geocoder);

map.on("load", function () {
  const nav = new mapboxgl.NavigationControl();
  map.addControl(nav, "top-left");

  map.addControl(new mapboxgl.FullscreenControl(), "top-left");

  // Live GPS
  var geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true,
    },
    trackUserLocation: true,
    showUserHeading: true,
  });

  // map.addControl(geolocate, "top-left");

  // geolocate.on("geolocate", locateUser);

  // function locateUser(e) {
  //   document.getElementById("lat").value = e.coords.longitude;
  //   document.getElementById("lng").value = e.coords.latitude;
  //   geolocate.off("geolocate", null);
  // }
});

$(document).ready(function () {
  loadData();
});

loadData = () => {
  var id = $("#id").val();

  currentMarkers = [];
  currentGraphs = [];
  routeGraphs = [];
  distanceDuration = [];
  currentRoute = [];

  // Generate random string
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  generateString = (length) => {
    let result = " ";
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }

    return result;
  };

  $.ajax({
    url: site_url + "maps/graphs",
    type: "POST",
    data: {
      id: id,
    },
    dataType: "JSON",
    success: function (response) {
      // console.log(response.success.routeEnd[1][0]);
      if (response.success) {
        if (currentMarkers !== null) {
          for (var i = currentMarkers.length - 1; i >= 0; i--) {
            currentMarkers[i].remove();
          }
        }

        if (currentGraphs !== null) {
          for (var i = currentGraphs.length - 1; i >= 0; i--) {
            currentGraphs[i].remove();
          }
        }

        var lat = response.success.maps[0].lat;
        var lng = response.success.maps[0].lng;
        var latLng = [lng, lat];

        const marker = new mapboxgl.Marker({
          color: "#696cff",
        })
          .setLngLat(latLng)
          .addTo(map);

        var popup = new mapboxgl.Popup();
        popup.setHTML(`
        <div style="widht: auto; height: auto; padding: 20px 10px 20px 10px;">
            <h5>` + response.success.maps[0].title + `</h5>
            <img src="`+site_url+`writable/images/maps/`+response.success.maps[0].cover+`" class="img-fluid">
            <a href="`+site_url+`maps/`+encrypt_url(response.success.maps[0].id)+`" class="btn btn-sm btn-primary w-100 mt-3 text-white">Detail</a>
        </div>
        `);
        marker.setPopup(popup);

        currentMarkers.push(marker);

        for (var i = 0; i < response.success.maps.length; i++) {
          var graphsLat = response.success.maps[i].graphs_lat;
          var graphsLng = response.success.maps[i].graphs_lng;
          var graphsLatLng = [graphsLng, graphsLat];

          const el = document.createElement("div");
          el.className = "marker";

          const graphs = new mapboxgl.Marker(el)
            .setLngLat(graphsLatLng)
            .addTo(map);

          var popup = new mapboxgl.Popup();
          popup.setHTML(
            `<div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
                <h4 class="text-center">` + response.success.maps[i].nama +`</h4>
            </div>`
          );
          graphs.setPopup(popup);

          currentGraphs.push(graphs);
        }

        (async () => {
          for (var i = 0; i < response.success.routeStart.length; i++) {
            var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${response.success.routeStart[i].lng},${response.success.routeStart[i].lat};${response.success.routeEnd[i][0].lng},${response.success.routeEnd[i][0].lat}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

            const query = fetch(url);

            const json = query.then((response) => response.json());
            var distance;
            var duration;
            const data = json.then((response) => {
              distance = response.routes[0].distance;
              duration = response.routes[0].duration;

              const geojson = {
                type: "geojson",
                data: {
                  type: "Feature",
                  properties: {},
                  geometry: {
                    type: "LineString",
                    coordinates: response.routes[0].geometry.coordinates,
                  },
                },
              };

              var routeId = `route${generateString(5)}`;

              currentRoute.push(routeId);

              map.addSource(routeId, geojson);

              map.addLayer({
                id: routeId,
                type: "line",
                source: routeId,
                layout: {
                  "line-join": "round",
                  "line-cap": "round",
                },
                paint: {
                  "line-color": "red",
                  "line-width": 5,
                  "line-opacity": 0.75,
                },
              });
            });
            await data;
            routeGraphs.push([
              `${response.success.routeStart[i].lng}`,
              `${response.success.routeStart[i].lat}`,
              `${response.success.routeEnd[i][0].lng}`,
              `${response.success.routeEnd[i][0].lat}`,
              `${distance}`,
              `${duration}`,
              `${response.success.routeStart[i].nama}`,
              `${response.success.routeEnd[i][0].nama}`,
            ]);
          }

          // Set Route Finish
          var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${response.success.routeStartFinish[0][3]},${response.success.routeStartFinish[0][2]};${response.success.routeEndFinish[0][3]},${response.success.routeEndFinish[0][2]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

          const query = fetch(url);

          const json = query.then((response) => response.json());
          var distance;
          var duration;
          const data = json.then((response) => {
            distance = response.routes[0].distance;
            duration = response.routes[0].duration;

            const geojson = {
              type: "geojson",
              data: {
                type: "Feature",
                properties: {},
                geometry: {
                  type: "LineString",
                  coordinates: response.routes[0].geometry.coordinates,
                },
              },
            };

            var routeId = `route${generateString(5)}`;

            currentRoute.push(routeId);

            map.addSource(routeId, geojson);

            map.addLayer({
              id: routeId,
              type: "line",
              source: routeId,
              layout: {
                "line-join": "round",
                "line-cap": "round",
              },
              paint: {
                "line-color": "red",
                "line-width": 5,
                "line-opacity": 0.75,
              },
            });
          });
          await data;
          routeGraphs.push([
            `${response.success.routeStartFinish[0][3]}`,
            `${response.success.routeStartFinish[0][2]}`,
            `${response.success.routeEndFinish[0][3]}`,
            `${response.success.routeEndFinish[0][2]}`,
            `${distance}`,
            `${duration}`,
            `${response.success.routeStartFinish[0][0]}`,
            `${response.success.routeEndFinish[0][1]}`,
          ]);


        })();

        // console.log(routeGraphs);
        // console.log(distanceDuration);
      }

      if (response.no_graphs) {
        if (currentMarkers !== null) {
          for (var i = currentMarkers.length - 1; i >= 0; i--) {
            currentMarkers[i].remove();
          }
        }

        if (currentGraphs !== null) {
          for (var i = currentGraphs.length - 1; i >= 0; i--) {
            currentGraphs[i].remove();
          }
        }

        var lat = response.no_graphs.lat;
        var lng = response.no_graphs.lng;
        var latLng = [lng, lat];

        const marker = new mapboxgl.Marker({
          color: "#696cff",
        })
          .setLngLat(latLng)
          .addTo(map);

        currentMarkers.push(marker);
      }
    },
    // async: false,
  });
};

store = () => {
  var id = $("#wisata").val();

  $("#btnGraphs").attr("disabled", true);

  const el = document.createElement("div");
  el.className = "marker";

  const marker = new mapboxgl.Marker(el, {
    draggable: true,
  })
    .setLngLat(defaultLocation)
    .addTo(map);

  currentGraphsNew.push(marker);

  $.ajax({
    url: site_url + "maps/graphs/route",
    method: "POST",
    data: {
      id: id,
    },
    success: function (response) {
      var graphs = response.success.graphs;

      var option = "";
      graphs.forEach((e) => {
        option += "<option value=" + e.id + ">" + e.nama + "</option>";
      });

      marker.on("dragend", function (e) {
        var lngLat = e.target.getLngLat();

        document.getElementById("lat").value = lngLat.lat;
        document.getElementById("lng").value = lngLat.lng;

        var id = $("#id").val();
        var lat = $("#lat").val();
        var lng = $("#lng").val();

        Swal.fire({
          title: "Tambah Graph ?",
          icon: "question",
          html:
            `
                        <input type="hidden" value="` +
            id +
            `" name="id" id="id">
                        <input type="hidden" value="` +
            lat +
            `" name="lat" id="lat">
                        <input type="hidden" value="` +
            lng +
            `" name="lng" id="lng">
                        <input type="text" class=" form-control" name="nama" placeholder="Nama Graph" id="nama" >
                        <div class="invalid-feedback d-inline error_nama"></div>
                        <select class="form-select mt-3" name="tujuan" id="tujuan">
                        <option value="" disabled selected>Pilih Tujuan</option>` +
            option +
            `</select>`,
          showCancelButton: true,
          showConfirmButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          cancelButtonText: "Batal",
          confirmButtonText: "Ya, tambah !",
          preConfirm: () => {
            const id = Swal.getPopup().querySelector("#id").value;
            const lat = Swal.getPopup().querySelector("#lat").value;
            const lng = Swal.getPopup().querySelector("#lng").value;
            const nama = Swal.getPopup().querySelector("#nama").value;
            const tujuan = Swal.getPopup().querySelector("#tujuan").value;
            return {
              id: id,
              lat: lat,
              lng: lng,
              nama: nama,
              tujuan: tujuan,
            };
          },
        }).then((result) => {
          $.ajax({
            url: site_url + "admin/maps/graphs/store",
            type: "POST",
            dataType: "JSON",
            data: {
              id: result.value.id,
              lat: result.value.lat,
              lng: result.value.lng,
              nama: result.value.nama,
              tujuan: result.value.tujuan,
            },
            success: function (response) {
              if (response.error) {
                if (response.error.nama) {
                  Swal.fire({
                    title: "Gagal !",
                    text: response.error.nama,
                    icon: "warning",
                    showConfirmButton: false,
                    timer: 2100,
                  });
                }
                if (response.error.nama) {
                  Swal.fire({
                    title: "Gagal !",
                    text: response.error.nama,
                    icon: "warning",
                    showConfirmButton: false,
                    timer: 2100,
                  });
                }
              } else {
                Swal.fire({
                  title: "Berhasil!",
                  text: response.message,
                  icon: "success",
                  showConfirmButton: false,
                  timer: 2100,
                });
                setTimeout(() => {
                  location.href = site_url + "admin/maps/graphs";
                }, 2100);
              }
            },
          });
        });
      });
    },
  });
};

$(".mapboxgl-ctrl-geocoder--input").change(function () {
  var value = $(this).val();
  value = value.replace(/\s+/g, "");

  var url =
    "https://api.mapbox.com/geocoding/v5/mapbox.places/" +
    value +
    ".json?limit=1&types=place%2Cpostcode%2Caddress&access_token=pk.eyJ1IjoicmluZ2dvMDciLCJhIjoiY2t4MHB2ZjJ0MHV3YzJycHo0OHhzZGIwOSJ9.odEp1QZ9gCcw9biNi2j6Tg";

  $.ajax({
    url: url,
    method: "GET",
    dataType: "JSON",
    success: function (res) {
      var lat = res.features[0].geometry.coordinates[1];
      var lng = res.features[0].geometry.coordinates[0];

      $("#lat").val(lat);
      $("#lng").val(lng);
    },
  });

  $('#btnPosisi').html(
    `<button class="btn btn-success btn-sm mt-2">Mulai Jelajahi</button>`
  );

});

deleteGraphs = () => {

  var id = $('#wisata').val();

  Swal.fire({
    title: "Hapus graphs ?",
    text: "Proses ini akan menghapus data secara permanent!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, hapus!",
  }).then((result) => {
    if (result.isConfirmed) {
      let csrf = $('meta[name="csrf-token"]').attr("content");
      $.ajax({
        url: site_url + "admin/maps/graphs",
        data: {
          id: id,
          _method: "DELETE",
          _token: csrf,
        },
        type: "POST",
        dataType: "JSON",
        success: function (response) {
          Swal.fire({
            title: "Berhasil!",
            text: response.message,
            icon: "success",
            showConfirmButton: false,
            timer: 2100,
          });
          location.href = site_url + "admin/maps/graphs";
        },
        error: function (jqXHR, textStatus, errorThrown) {
          Swal.fire({
            title: "Maaf data gagal di hapus!",
            html: `Silahkan Cek kembali Kode Error: <strong>${jqXHR.status + "\n"
              }</strong> `,
            icon: "error",
            showConfirmButton: false,
            timer: 2100,
          });
        },
      });
    }
  });
};

var startCurrentRoute = [];

setPosisi = () => {

  let w = window.innerWidth;

  var id = $("#id").val();
  var lat = $("#lat").val();
  var lng = $("#lng").val();
  var distance1 = [];
  var length = [];

  if(w > 576){
    $('#res').show();
    $('#res').html(`
      <div class="bg bg-dark text-white mt-2 p-4" style="border-radius: 4px;">
        <p>Hasil Route Graphs Tercepat : </p>
        <div id="resGraphs"></div>
      </div>
    `)
  }

  if(w <= 576){
    $('#res2').show();
    $('#res2').html(`
    <div class="bg bg-dark text-white mt-3 p-4" style="border-radius: 4px;">
      <p>Hasil Route Graphs Tercepat : </p>
      <div id="resGraphs"></div>
    </div>
  `)
  }

  for (var i = 0; i < startCurrentRoute.length; i++) {
    if (map.getLayer(startCurrentRoute[i])) {
      map.removeLayer(startCurrentRoute[i]);
    }
    if (map.getSource(startCurrentRoute[i])) {
      map.removeSource(startCurrentRoute[i]);
    }
  }

  // Route Line
  for (var i = 0; i < currentRoute.length; i++) {
    if (map.getLayer(currentRoute[i])) {
        map.removeLayer(currentRoute[i]);
    }
    if (map.getSource(currentRoute[i])) {
        map.removeSource(currentRoute[i]);
    }
  }

  // Graphs Red
  if (currentGraphs !== null) {
    for (var i = currentGraphs.length - 1; i >= 0; i--) {
      currentGraphs[i].remove();
    }
  }

  if (currentGraphsNew !== null) {
    for (var i = currentGraphsNew.length - 1; i >= 0; i--) {
        currentGraphsNew[i].remove();
    }
  }

  $.ajax({
    url: site_url + "maps/graphs/setPosisi",
    type: "POST",
    data: {
      id: id,
      lat: lat,
      lng: lng
    },
    dataType: "JSON",
    success: function (response) {

      const routeStart = [response.success.lng, response.success.lat];
      var shortRoutes = [];
      var distance = [];
      var latLngStart = [];

      (async () => {
        for (var i = 0; i < response.success.routeEnd.length; i++) {
          var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${routeStart[0]},${routeStart[1]};${response.success.routeEnd[i].lng},${response.success.routeEnd[i].lat}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

          const query = fetch(url);

          const json = query.then((response) => response.json());

          var duration;

          const data = json.then((response) => {
            // distance = response.routes[0].distance;
            distance.push(response.routes[0].distance);

            duration = response.routes[0].duration;

          }).catch((err) => {
            Swal.fire({
              title: "Maaf jarak terlalu jauh !",
              html: "Silahkan ganti titik koordinat atau geser markup dan pastikan berada di negara Indonesia !",
              icon: "error",
              showConfirmButton: false,
              timer: 2100,
            });
          });

          // shortRoutes.push([`${response.success.routeEnd[i].lng}`,`${response.success.routeEnd[i].lat}`]);

          await data;

          shortRoutes.push({
            'lat': response.success.routeEnd[i].lat,
            'lng': response.success.routeEnd[i].lng,
            'distance': parseInt(distance[i]),
            'nama': response.success.routeEnd[i].nama
          });

        }

        var distanceRoute = [];

        for (var i = 0; i < shortRoutes.length; i++) {
          distanceRoute.push(shortRoutes[i].distance);
        }

        var route = Math.min.apply(null, distanceRoute);
        // console.log(route);

        for (var i = 0; i < shortRoutes.length; i++) {
          if (shortRoutes[i].distance === route) {
            latLngStart.push([`${shortRoutes[i].lng}`, `${shortRoutes[i].lat}`, `${shortRoutes[i].distance}`, `${shortRoutes[i].nama}`])
          }
        }

        var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${routeStart[0]},${routeStart[1]};${latLngStart[0][0]},${latLngStart[0][1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

        const query = fetch(url);

        const json = query.then((response) => response.json());

        var duration;

        const data = json.then((response) => {
          // distance = response.routes[0].distance;
          distance1.push(response.routes[0].distance);

          duration = response.routes[0].duration;

          const geojson = {
            type: "geojson",
            data: {
              type: "Feature",
              properties: {},
              geometry: {
                type: "LineString",
                coordinates: response.routes[0].geometry.coordinates,
              },
            },
          };

          var line = turf.lineString(geojson.data.geometry.coordinates);
          length1 = turf.length(line, {units: 'miles'});
          // length = length1;
          length.push(length1.toFixed(2));
          var routeId = `route${generateString(5)}`;
          startCurrentRoute.push(routeId);

          map.addSource(routeId, geojson);

          map.addLayer({
            id: routeId,
            type: "line",
            source: routeId,
            layout: {
              "line-join": "round",
              "line-cap": "round",
            },
            paint: {
              "line-color": "red",
              "line-width": 5,
              "line-opacity": 0.75,
            },
          });

        });
        
        var start = [latLngStart[0][3],latLngStart[0][0],latLngStart[0][1]];

        var graphsLatLng = [latLngStart[0][0],latLngStart[0][1]];

        // Make Grapsh Result
        var el = document.createElement("div");
        el.className = "marker";

        var graphs = new mapboxgl.Marker(el)
          .setLngLat(graphsLatLng)
          .addTo(map);

        var popup = new mapboxgl.Popup();
        popup.setHTML(
          `<div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
              <h4 class="text-center">` + start[0] +`</h4>
          </div>`
        );
        graphs.setPopup(popup);

        currentGraphs.push(graphs);

        var graphsLatLng = [routeGraphs.slice(-1)[0][0],routeGraphs.slice(-1)[0][1]];

        var el = document.createElement("div");
        el.className = "marker";

        var graphs = new mapboxgl.Marker(el)
          .setLngLat(graphsLatLng)
          .addTo(map);

          var popup = new mapboxgl.Popup();
          popup.setHTML(
            `<div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
                <h4 class="text-center">` + routeGraphs.slice(-1)[0][6] +`</h4>
            </div>`
          );
          graphs.setPopup(popup);

        currentGraphs.push(graphs);

        // Set Route
        var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${routeGraphs.slice(-1)[0][0]},${routeGraphs.slice(-1)[0][1]};${routeGraphs.slice(-1)[0][2]},${routeGraphs.slice(-1)[0][3]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

        const query2 = fetch(url);

        const json2 = query2.then((response) => response.json());

        var duration;
        var distance2 = [];

        const data2 = json2.then((response) => {
          // distance = response.routes[0].distance;
          distance2.push(response.routes[0].distance);

          duration = response.routes[0].duration;

          const geojson = {
            type: "geojson",
            data: {
              type: "Feature",
              properties: {},
              geometry: {
                type: "LineString",
                coordinates: response.routes[0].geometry.coordinates,
              },
            },
          };

          var line = turf.lineString(geojson.data.geometry.coordinates);
          var length2 = turf.length(line, {units: 'miles'});

          var routeId = `route${generateString(5)}`;
          startCurrentRoute.push(routeId);

          map.addSource(routeId, geojson);

          map.addLayer({
            id: routeId,
            type: "line",
            source: routeId,
            layout: {
              "line-join": "round",
              "line-cap": "round",
            },
            paint: {
              "line-color": "red",
              "line-width": 5,
              "line-opacity": 0.75,
            },
          });

        });

      // Set Route

      var finish1 = start[1];
      var finish2 = routeGraphs.slice(-1)[0][0];

      if(finish1 == finish2){
        var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${start[1]},${start[2]};${response.success.maps.lng},${response.success.maps.lat}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

        const query3 = fetch(url);

        const json3 = query3.then((response) => response.json());

        var duration;
        var distance3;

        const data3 = json3.then((response) => {
          // distance = response.routes[0].distance;
          distance3 = response.routes[0].distance;

          duration = response.routes[0].duration;

          const geojson = {
            type: "geojson",
            data: {
              type: "Feature",
              properties: {},
              geometry: {
                type: "LineString",
                coordinates: response.routes[0].geometry.coordinates,
              },
            },
          };

          var line = turf.lineString(geojson.data.geometry.coordinates);
          var length3 = turf.length(line, {units: 'miles'});

          var routeId = `route${generateString(5)}`;
          startCurrentRoute.push(routeId);

          map.addSource(routeId, geojson);

          map.addLayer({
            id: routeId,
            type: "line",
            source: routeId,
            layout: {
              "line-join": "round",
              "line-cap": "round",
            },
            paint: {
              "line-color": "red",
              "line-width": 5,
              "line-opacity": 0.75,
            },
          });
          var resDistance = parseFloat(distance2[0]+distance3[0]);

          var resLength = parseFloat(length[0])+parseFloat(length3.toFixed(2));

          $('#resGraphs').html(
            '<p>Route : '+routeGraphs.slice(-1)[0][6]+' &rarr; '+routeGraphs.slice(-1)[0][7]
            +'</p>'+
            '<p>Jarak : '+resLength.toFixed(2)+' KM</p>'
            );
        });
      }

      else {

        var url = `https://api.mapbox.com/directions/v5/mapbox/driving/${start[1]},${start[2]};${routeGraphs.slice(-1)[0][0]},${routeGraphs.slice(-1)[0][1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;

        const query3 = fetch(url);

        const json3 = query3.then((response) => response.json());

        var duration;
        var distance3;

        const data3 = json3.then((response) => {
          // distance = response.routes[0].distance;
          distance3 = response.routes[0].distance;

          duration = response.routes[0].duration;

          const geojson = {
            type: "geojson",
            data: {
              type: "Feature",
              properties: {},
              geometry: {
                type: "LineString",
                coordinates: response.routes[0].geometry.coordinates,
              },
            },
          };

          var line = turf.lineString(geojson.data.geometry.coordinates);
          var length3 = turf.length(line, {units: 'miles'});

          var routeId = `route${generateString(5)}`;
          startCurrentRoute.push(routeId);

          map.addSource(routeId, geojson);

          map.addLayer({
            id: routeId,
            type: "line",
            source: routeId,
            layout: {
              "line-join": "round",
              "line-cap": "round",
            },
            paint: {
              "line-color": "red",
              "line-width": 5,
              "line-opacity": 0.75,
            },
          });
          var resDistance = parseFloat(distance2[0]+distance3[0]);
          var resLength = parseFloat(length[0])+parseFloat(length3.toFixed(2));
          
          $('#resGraphs').html(
            '<p>Route : '+start[0]+' &rarr; '+routeGraphs.slice(-1)[0][6]+' &rarr; '+routeGraphs.slice(-1)[0][7]
            +'</p>'+
            '<p>Jarak : '+resLength.toFixed(2)+' KM</p>'
            );
        });

      }
      })();

    },
    error: function () {
      alert('error');
    }
  });
}