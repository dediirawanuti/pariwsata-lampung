<?= $this->extend('frontend/master'); ?>
<?= $this->section('content'); ?>


<div class="flex flex-col items-center justify-center mx-4 md:mx-24 my-4 md:my-20">
    <h3 class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white mb-6">Pilih Kategori</h3>
    <ul class="flex mb-4">
        <?php foreach ($kategori as $item) : ?>
            <li class="mr-4">
                <a href="<?= site_url('kategori/' . encrypt_url($item['id'])) ?>" class="border border-gray-400 px-4 py-2 rounded hover:bg-gray-200 dark:hover:bg-gray-500 dark:text-gray-200"><?= $item['nama'] ?></a>
            </li>
        <?php endforeach; ?>
    </ul>
</div>


<h3 class="text-center font-semibold text-xl mb-4 dark:text-white"><?= (isset($maps[0]['nama']) ? $maps[0]['nama'] : 'Kategori of Wisata'); ?></h3>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 justify-center mx-4 md:mx-24 my-4 md:my-20">
    <?php if (count($maps) > 0) : ?>
        <?php foreach ($maps as $w) : ?>
            <div class="cols-span-1">
                <div class="card cardhome rounded">
                    <a href="<?= base_url('maps/' . encrypt_url($w['id'])); ?>">
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

<?= $this->endSection(); ?>