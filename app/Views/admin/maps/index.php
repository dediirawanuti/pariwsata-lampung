<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>

<div class="position-relative">
    <div id="map" style="width: 100%; height: 75vh; border-radius: 5px"></div>

    <div style="margin-top: 1rem; position: absolute; top: 0; left: 4rem;" class="d-flex">
        <input type="hidden" class="form-control form-control-sm" value="" id="lat" placeholder="lat">
        <input type="hidden" class="form-control form-control-sm" value="" id="lng" style=" margin-left: 1rem; margin-right: 1rem;" placeholder="lng">
    </div>

    <?php if ($map == null) : ?>
        <div style="margin-top: 1rem; position: absolute; top: 40%; left: 35%;">
            <div class="text-center text-white">
                <h4>Tidak ada maps, tambah maps terlebih dahulu !</h4>
            </div>
            <a href="<?= base_url('admin/maps/add') ?>" class="btn btn-primary btn-sm mt-2" style="margin-left: 35%">Tambah Maps</a>
        </div>
    <?php endif ?>
</div>

<script>
    var key = 'pk.eyJ1IjoicmluZ2dvMDciLCJhIjoiY2t4MHB2ZjJ0MHV3YzJycHo0OHhzZGIwOSJ9.odEp1QZ9gCcw9biNi2j6Tg';
    var defaultLocation = [105.2625, -5.42944];

    mapboxgl.accessToken = key;

    var currentMarkers = [];

    // Initial Map
    var map = new mapboxgl.Map({
        container: 'map',
        // style: 'mapbox://styles/mapbox/satellite-v9',
        style: "mapbox://styles/mapbox/streets-v11",
        center: [105.2625, -5.42944],
        zoom: 8,
        attributionControl: false,
    });

    // Search box
    const geocoder = new MapboxGeocoder({
        mapboxgl: mapboxgl,
        accessToken: mapboxgl.accessToken,
        marker: false,
        placeholder: 'Tentukan lokasi anda'
    });

    geocoder.on('result', e => {
        // Remove markers
        if (currentMarkers !== null) {
            for (var i = currentMarkers.length - 1; i >= 0; i--) {
                currentMarkers[i].remove();
            }
        }

        const marker = new mapboxgl.Marker({
                draggable: true,
                color: 'green'
            })
            .setLngLat(e.result.center)
            .addTo(map)

        var popup = new mapboxgl.Popup();
        popup.setHTML(`
            <div style="widht: auto; height: auto; padding: 20px 10px 0px 10px;">
                <h5 style="color: black">Lokasi kamu sekarang !</h5>
                <img src="<?= site_url('writable/images/maps/myLocation.png') ?>" class="img-fluid">
            </div>
            `);
        marker.setPopup(popup);

        currentMarkers.push(marker);

        marker.on('dragend', function(e) {
            var lngLat = e.target.getLngLat();
            document.getElementById('lat').value = lngLat.lat;
            document.getElementById('lng').value = lngLat.lng;
        });
    });

    map.addControl(geocoder);

    map.on('load', function() {
        // Set marker
        <?php foreach ($map as $key) : ?>
            var defaultLocation = [<?= $key['lng'] ?>, <?= $key['lat'] ?>];
            var marker = new mapboxgl.Marker({
                    color: '#696cff'
                })
                .setLngLat(defaultLocation)
                .addTo(map);

            var popup = new mapboxgl.Popup();
            popup.setHTML(`
            <div style="widht: auto; height: auto; padding: 20px 10px 20px 10px;">
                <h5><?= $key['title'] ?></h5>
                <img src="<?= site_url('writable/images/maps/' . $key['cover']) ?>" class="img-fluid">
                <a href="<?= site_url('admin/maps/detail-maps/' . encrypt_url($key['id'])) ?>" class="btn btn-sm btn-primary w-100 mt-3">Detail</a>
            </div>
            `);
            marker.setPopup(popup);
        <?php endforeach ?>

        // currentMarkers.push(marker);

        // Set navigation controller 
        const nav = new mapboxgl.NavigationControl();
        map.addControl(nav, 'top-left');

        map.addControl(new mapboxgl.FullscreenControl(), 'top-left');

        // Live GPS
        var geolocate = new mapboxgl.GeolocateControl({
            positionOptions: {
                enableHighAccuracy: true
            },
            trackUserLocation: true,
            showUserHeading: true
        });

        map.addControl(geolocate, 'top-left');

        geolocate.on('geolocate', locateUser);

        function locateUser(e) {
            document.getElementById('lat').value = e.coords.longitude;
            document.getElementById('lng').value = e.coords.latitude;
            geolocate.off('geolocate', null);
        }

    });
</script>

<script>
    $('.mapboxgl-ctrl-geocoder--input').change(function() {

        var value = $(this).val();

        value = value.replace(/\s+/g, '');

        var url = "https://api.mapbox.com/geocoding/v5/mapbox.places/" + value + ".json?limit=1&types=place%2Cpostcode%2Caddress&access_token=pk.eyJ1IjoicmluZ2dvMDciLCJhIjoiY2t4MHB2ZjJ0MHV3YzJycHo0OHhzZGIwOSJ9.odEp1QZ9gCcw9biNi2j6Tg";

        $.ajax({
            url: url,
            method: 'GET',
            dataType: 'JSON',
            success: function(res) {
                var lat = res.features[0].geometry.coordinates[1];
                var lng = res.features[0].geometry.coordinates[0];

                $('#lat').val(lat);
                $('#lng').val(lng);
            }
        });

    });
</script>

<?= $this->endSection() ?>