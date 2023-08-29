<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>

<div class="position-relative">
    <div id="map" style="width: 100%; height: 75vh; border-radius: 5px"></div>

    <?php if ($maps != null) : ?>
        <div style="margin-top: 1rem; position: absolute; top: 0; left: 4rem;">
            <select name="wisata" id="wisata" class="form-select form-select-sm" onchange="markup()">
                <?php foreach ($maps as $key) : ?>
                    <option value="<?= $key['id'] ?>"><?= $key['title'] ?></option>
                <?php endforeach ?>
            </select>
            <div>
                <button class="btn btn-primary btn-sm mt-2" onclick="store()" id="btnGraphs">Tambah Graph</button>

                <!-- <div id="btnPosisi" onclick="setPosisi()"></div> -->
                <br>

                <button class="btn btn-danger btn-sm mt-2" onclick="deleteGraphs()">Hapus Graphs</button>

                <div class="mt-2">
                    <input type="hidden" class="form-control form-control-sm" name="id" id="id" value="<?= $maps[0]['id'] ?>">
                    <input type="hidden" class="form-control form-control-sm" value="" id="lat" placeholder="lat">
                    <input type="hidden" class="form-control form-control-sm" value="" id="lng" style="margin-right: 1rem;" placeholder="lng">
                </div>
            </div>
        </div>
    <?php endif ?>
    <?php if ($maps == null) : ?>
        <div style="margin-top: 1rem; position: absolute; top: 40%; left: 35%;">
            <div class="text-center text-white">
                <h4 class="text-dark">Tidak ada graphs, tambah maps terlebih dahulu !</h4>
            </div>
            <a href="<?= base_url('admin/maps/add') ?>" class="btn btn-primary btn-sm mt-2" style="margin-left: 35%">Tambah Maps</a>
        </div>
    <?php endif ?>
</div>
<script>
    var currentMarkers = [];
    var currentGraphs = [];
    var currentGraphsNew = [];
    var currentRoute = [];

    markup = () => {

        var routeGraphsOnChange = [];

        for (var i = 0; i < currentRoute.length; i++) {
            if (map.getLayer(currentRoute[i])) {
                map.removeLayer(currentRoute[i]);
            }
            if (map.getSource(currentRoute[i])) {
                map.removeSource(currentRoute[i]);
            }
        }

        for (var i = 0; i < startCurrentRoute.length; i++) {
            if (map.getLayer(startCurrentRoute[i])) {
                map.removeLayer(startCurrentRoute[i]);
            }
            if (map.getSource(startCurrentRoute[i])) {
                map.removeSource(startCurrentRoute[i]);
            }
        }

        $('#btnGraphs').attr('disabled', false);

        if (currentGraphsNew !== null) {
            for (var i = currentGraphsNew.length - 1; i >= 0; i--) {
                currentGraphsNew[i].remove();
            }
        }

        var id = $('#wisata').val();
        $('#id').val(id);

        $.ajax({
            url: site_url + 'maps/graphs/getMarkup',
            method: 'POST',
            data: {
                id: id
            },
            dataType: 'JSON',
            success: function(response) {
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
                            color: '#696cff'
                        })
                        .setLngLat(latLng)
                        .addTo(map)

                    if (response.success.maps[0]) {
                        var popup = new mapboxgl.Popup();
                        popup.setHTML(`
                        <div style="widht: auto; height: auto; padding: 20px 10px 20px 10px;">
                            <h5>` + response.success.maps[0].title + `</h5>
                            <img src="<?= site_url('writable/images/maps/') ?>` + response.success.maps[0].cover + `" class="img-fluid">
                            <?php if ($maps != null) : ?>
                            <a href="<?= site_url('admin/maps/detail-maps/' . encrypt_url($key['id'])) ?>" class="btn btn-sm btn-primary w-100 mt-3">Detail</a>
                            <?php endif ?>
                        </div>
                        `);
                        marker.setPopup(popup);
                    }
                    currentMarkers.push(marker);

                    for (var i = 0; i < response.success.maps.length; i++) {

                        var graphsLat = response.success.maps[i].graphs_lat;
                        var graphsLng = response.success.maps[i].graphs_lng;
                        var graphsLatLng = [graphsLng, graphsLat];

                        const el = document.createElement('div');
                        el.className = 'marker';

                        const graphs = new mapboxgl.Marker(el)
                            .setLngLat(graphsLatLng)
                            .addTo(map)

                        var popup = new mapboxgl.Popup();
                        popup.setHTML(`
                        <div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
                            <h4 class="text-center">` + response.success.maps[i].nama + `</h4>
                        </div>
                        `);
                        graphs.setPopup(popup);

                        currentGraphsNew.push(graphs);
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
                            routeGraphsOnChange.push([
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
                        routeGraphsOnChange.push([
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

                    console.log(routeGraphsOnChange);

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
                            color: '#696cff'
                        })
                        .setLngLat(latLng)
                        .addTo(map)

                    currentMarkers.push(marker);
                }
            },
            error: function(xhr, ajaxOptions, thrownerror) {
                alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
            },
        })
    }
</script>
<?= $this->endSection() ?>