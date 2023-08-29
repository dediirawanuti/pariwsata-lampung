<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5><?= (isset($title)) ? $title : ''; ?></h5>
                <hr>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <h5><?= $map[0]['title'] ?></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-9 col-12">
                        <div id="map" class="w-100" style="height: 70vh; border-radius: 5px;"><?= $map[0]['gmaps']; ?></div>
                        <div class="my-3">
                            <h5>Deskripsi</h5>
                            <?= $map[0]['desc'] ?>
                        </div>
                    </div>
                    <div class="col-xl-3 col-12">
                        <img src="<?= base_url('writable/images/maps/' . $map[0]['cover']) ?>" alt="" class="img-thumbnail">
                        <div class="my-3">
                            <h5>Kategori</h5>
                            <P><?= $map[0]['nama'] ?></P>
                        </div>
                        <div class="my-3">
                            <h5>Alamat</h5>
                            <P><?= $map[0]['alamat'] ?></P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>