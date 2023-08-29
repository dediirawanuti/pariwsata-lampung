<?= $this->extend('frontend/master'); ?>
<?= $this->section('content'); ?>

<div class="flex flex-col items-center justify-center mx-4 md:mx-24 my-4 md:my-20">
    <form action="<?= site_url('search'); ?>" method="get" class="flex">
        <label for="search-dropdown" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Your Email</label>
        <button id="dropdown-button" data-dropdown-toggle="dropdown" class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-l-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600" type="button">
            All categories
            <svg aria-hidden="true" class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
            </svg>
        </button>
        <div id="dropdown" class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
            <ul class="py-2 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="dropdownLargeButton">
                <li class="flex flex-col m-4">
                    <?php foreach ($kategori as $c) : ?>
                        <a href="<?= site_url('kategori/' . encrypt_url($c['id'])); ?>" class="text-blue-500 hover:text-blue-600"><?= ucwords($c['nama']); ?></a>
                    <?php endforeach; ?>
                </li>
            </ul>
        </div>
        <div class="relative w-full">
            <input type="search" id="search-dropdown" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-l-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500" placeholder="Search Mockups, Logos, Design Templates..." required>
            <button type="submit" class="absolute top-0 right-0 p-2.5 text-sm font-medium text-white bg-blue-700 rounded-r-lg border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
                <span class="sr-only">Search</span>
            </button>
        </div>
    </form>
</div>
<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 flex justify-center mx-4 md:mx-24 my-4 md:my-20">
    <?php if (count($search) > 0) : ?>
        <?php foreach ($search as $w) : ?>
            <div class="cols-span-1">
                <div class="card cardhome rounded">
                    <a href="<?= site_url('maps/' . encrypt_url($w['id'])); ?>">
                        <img src="<?= base_url("/assets/frontend/images/hero.jpg"); ?>" class="img-card-top" alt="Nama Destinasi">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title text-center text-xl md:text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                            <?= ucfirst($w['title']); ?>
                        </h5>
                        <p class="card-text">
                            Tempat Destinasi
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



<?= $this->endSection(); ?>