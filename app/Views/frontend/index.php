<?= $this->extend('frontend/master') ?>
<?= $this->section('content'); ?>

<style>
    #panorama {
        width: 1366px;
        height: 625px;
        border-radius: 4px;
    }
</style>

<div class="flex h-screen flex-wrap justify-center mx-4 md:mx-24 my-4 md:my-20">
    <div id="panorama">
        <script>
            pannellum.viewer('panorama', {
                "type": "equirectangular",
                "panorama": "<?= base_url("/assets/frontend/images/hero.jpg"); ?>",
                "autoLoad": true,
                "autoRotate": 2,
                "title": "Panorama 360",
                "author": "pesawaran.info"
            });
        </script>
    </div>
</div>

<div class="flex justify-center m-4">
    <h1 class="flex items-center text-2xl font-extrabold dark:text-white">Destinasi Wisata<span class="bg-blue-100 text-blue-800 text-2xl font-semibold mr-2 px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ml-2">360°</span></h1>
</div>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 justify-center mx-4 md:mx-24 my-4 md:my-20">
    <?php if (count($wisata) > 0) : ?>
        <?php foreach ($wisata as $w) : ?>
            <div class="cols-span-1">
                <div class="card cardhome rounded">
                    <a href="<?= site_url('maps/' . encrypt_url($w['id'])); ?>">
                        <img src="<?= base_url("writable/images/maps/" . $w['cover']); ?>" class="img-card-top" alt="Nama Destinasi">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title text-center text-xl md:text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                            <?= ucfirst($w['title']); ?>
                        </h5>
                        <p class="card-text">
                            <?= ucfirst($w['alamat']); ?>
                        </p>
                    </div>
                    <div class="card-footer">
                        <div class="text-by">
                            by <?= sistem()->nama; ?>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

<div class="flex items-center justify-center mx-4 md:mx-24 my-4 md:my-20">
    <?= $pager->links('maps', 'frontend_pager'); ?>
</div>


<?= $this->endSection('content'); ?>