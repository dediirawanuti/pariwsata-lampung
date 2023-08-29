<?= $this->extend('frontend/master'); ?>

<?= $this->section('content'); ?>

<title><?= $title; ?></title>

<div class="flex flex-col items-center justify-center min-h-screen mx-4 md:mx-24 my-4 md:my-20">
    <div class="max-w-md mx-auto px-4">
        <h2 class="text-2xl font-bold mb-4 text-center">Tentang Kami</h2>
        <p class="text-center mb-8">
            <a><?= ucfirst(sistem()->tentang); ?></a>
            <a class="text-blue-600 after:content-['_↗']" href="<?= base_url(); ?>">Pesawaran.info</a> adalah sebuah website virtual tour 360° pariwisata yang ada di Pesawaran. Untuk mendukung digitalisasi pariwisata dan memperkenalkan pariwisata yang ada di Pesawaran melalui website.
            <a class="text-blue-600 after:content-['_↗']" href="<?= base_url(); ?>">Pesawaran.info</a> Juga di buat untuk memenuhi syarat kelulusan S-1 saya di <a class="text-blue-600 after:content-['_↗']" href="https://teknokrat.ac.id">Universitas Teknokrat Indonesia</a>
        </p>
        <div class="flex flex-wrap justify-center gap-4">
            <img src="<?= base_url('assets/frontend/images/1662041680_58ab6a600594ec40dd2d.png'); ?>" alt="Gambar 1" class="w-48 h-48">
            <img src="<?= base_url('assets/frontend/images/1662041776_bd598868117a222d6c5e.png'); ?>" alt="Gambar 1" class="w-48 h-48">
            <img src="<?= base_url('assets/frontend/images/1662041691_2575ebbba10917d47e61.png'); ?>" alt="Gambar 1" class="w-40 h-48">
        </div>
    </div>
</div>


<?= $this->endSection('content'); ?>