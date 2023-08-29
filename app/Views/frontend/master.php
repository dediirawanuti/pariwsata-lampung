<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?= ucwords(sistem()->nama); ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <meta name="description" content="Jelajahi destinasi wisata pesawaran melalui Virtual Tour">
    <meta name="keywords" content="Virtual Tour, Pembuatan Virtual Tour, Wisata Indonesia, Wisata Pesawaran">
    <!-- Add to homescreen for chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="IVT">
    <link rel="icon" sizes="512x512" href="<?= base_url(); ?>/assets/img/favicon.ico">

    <!--  Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="<?= base_url(); ?>/assets/img/apple-touch-icon.png" />
    <link rel="icon" sizes="32x32" type="image/png" href="<?= base_url(); ?>/assets/img/favicon-32x32.png" />
    <link rel="icon" sizes="16x16" type="image/png" href="<?= base_url(); ?>/assets/img/favicon-16x16.png" />

    <!-- Import Tailwind CSS -->
    <!-- <link rel="stylesheet" href="<?= base_url('assets/frontend/css/output.css'); ?>"> -->
    <script src="https://cdn.tailwindcss.com"></script>


    <!-- Tautan CSS Flowbite -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet" />

    <!-- Import Pannellum js -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js"></script>

    <!-- Import Custome Css -->
    <link rel="stylesheet" href="<?= base_url('assets/frontend/css/style.css'); ?>">

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <!-- Sweatalert 2 -->
    <link rel="stylesheet" href="<?= base_url() ?>/assets/vendor/sweetalert2/dist/sweetalert2.min.css" />

    <!-- Switcher Dark Mode -->
    <script>
        // On page load or when changing themes, best to add inline in `head` to avoid FOUC
        if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark');
        } else {
            document.documentElement.classList.remove('dark')
        }
    </script>

    <link rel="stylesheet" href="<?= base_url('assets/vendor/kartik-v/css/star-rating.min.css'); ?> " media="all" type="text/css" />
    <script src="<?= base_url('assets/vendor/kartik-v/js/star-rating.min.js'); ?>" type="text/javascript"></script>

</head>

<body class="dark:bg-gray-900">

    <!-- start nav -->
    <nav class="fixed w-full z-20 top-0 left-0 p-3 border-gray-200 rounded bg-gray-50 dark:bg-gray-800 dark:border-gray-700" id="navbar">
        <div class="container flex flex-wrap items-center justify-between mx-auto">
            <a href="<?= site_url(); ?>" class="flex items-center">
                <img src="<?= base_url('writable/images/sistem/' . sistem()->logo); ?>" class="h-6 mr-3 sm:h-10" alt="Pesawaran Logo" />
                <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Pesawaran</span>
            </a>
            <button data-collapse-toggle="navbar-solid-bg" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-solid-bg" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
                </svg>
            </button>
            <div class="hidden w-full md:block md:w-auto" id="navbar-solid-bg">
                <ul class="flex flex-col items-center mt-4 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-transparent dark:bg-gray-800 md:dark:bg-transparent dark:border-gray-700">
                    <li>
                        <a href="<?= site_url(); ?>" class="navbar-item block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent <?= (isset($active) && $active == 'beranda') ? 'active' : ''; ?>">Beranda</a>
                    </li>
                    <li>
                        <a href="<?= site_url(); ?>kategori" class="navbar-item block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent <?= (isset($active) && $active == 'Destinasi') ? 'active' : ''; ?>">Destinasi</a>
                    </li>
                    <li>
                        <a href="<?= base_url(); ?>collabs" class="navbar-item block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent <?= (isset($active) && $active == 'Collabs & Partner') ? 'active' : ''; ?>">Collabs & Partner</a>
                    </li>
                    <li>
                        <a href="<?= base_url(); ?>tentang" class="navbar-item block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent <?= (isset($active) && $active == 'tentang') ? 'active' : ''; ?>">Tentang</a>
                    </li>
                    <?php if (!session()->get('logged_in')) : ?>
                        <li>
                            <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button"><a href="<?= base_url('auth/login'); ?>">Login</a></button>
                        <?php else : ?>
                            <button id="dropdownAvatarNameButton" data-dropdown-toggle="dropdownAvatarName" class="flex items-center text-sm font-medium text-gray-900 rounded-full hover:text-blue-600 dark:hover:text-blue-500 md:mr-0 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:text-white" type="button">
                                <span class="sr-only">Open user menu</span>
                                <img class="w-8 h-8 mr-2 rounded-full" src="<?= base_url('writable/images/profile/' . (session()->get('foto') ? session()->get('foto') : '')) ?>" alt="user photo">
                                <?= (session()->get('nama') ? ucfirst(session()->get('nama')) : ''); ?>
                                <svg class="w-4 h-4 mx-1.5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownAvatarName" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformdropdownAvatarNameButtonationButton">
                                    <li>
                                        <?php if (session()->get('logged_in') && session()->get('logged_in') == true) : ?>
                                            <a href="<?= site_url('profile'); ?>" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Profile Saya</a>
                                    </li>
                                <?php endif; ?>
                                <a class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" href="javascript::void(0)" onclick="logout()">Logout</a>
                                </ul>
                            </div>
                        </li>
                    <?php endif; ?>
                    <li>
                        <button id="theme-toggle" type="button" class="text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5">
                            <svg id="theme-toggle-dark-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                            </svg>
                            <svg id="theme-toggle-light-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" fill-rule="evenodd" clip-rule="evenodd"></path>
                            </svg>
                            <span class="sr-only">Toggle Dark Mode</span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- end navbar -->

    <!-- start loading screen -->
    <div id="loading-screen" class="flex items-center justify-center fixed inset-0 bg-gradient z-50">
        <img src="<?= base_url('assets/img/android-chrome-512x512.png'); ?>" alt="Logo" class="loading-logo h-16 w-16">
    </div>
    <!-- end loading screen -->

    <div id="main-content" style="display: none;">
        <!-- Blog Start -->
        <?= $this->renderSection('content'); ?>
        <!-- Vendor End -->
    </div>

    <!-- start footer -->
    <footer class="border-gray-200 bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
        <div class="mx-auto w-full container p-4 sm:p-6">
            <div class="md:flex md:justify-between">
                <div class="mb-6 md:mb-0">
                    <a href="<?= site_url(); ?>" class="flex items-center">
                        <img src="<?= base_url('writable/images/sistem/' . sistem()->logo); ?>" class="h-8 mr-3" alt="Pesawaran Logo" />
                        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Pesawaran</span>
                    </a>
                </div>
                <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
                    <div>
                        <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Resources</h2>
                        <ul class="text-gray-600 dark:text-gray-400">
                            <li class="mb-4">
                                <a href="<?= base_url(); ?>" class="hover:underline">Pesawaran</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Contact Us</h2>
                        <ul class="text-gray-600 dark:text-gray-400">
                            <li class="mb-4">
                                <a href="mailto:noreply@pesawaran.info" class="hover:underline ">noreply@pesawaran.info</a>
                            </li>
                            <li>
                                <a href="https://wa.me/+628988290181" class="hover:underline">+628988290181</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Quick Link</h2>
                        <ul class="text-gray-600 dark:text-gray-400">
                            <li class="mb-4">
                                <a href="<?= base_url(); ?>tentang" class="hover:underline">Tentang</a>
                            </li>
                            <li>
                                <a href="<?= base_url(); ?>collabs" class="hover:underline">Collabs &amp; Partner</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
            <div class="sm:flex sm:items-center sm:justify-between">
                <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">Copyright © <?= date('Y'); ?>. <a href="<?= site_url(); ?>" class="hover:underline">Pesawaran Info</a> - Dedi Irawan
                </span>
            </div>
        </div>
    </footer>
    <!-- end footer -->

    <!-- Import darmode.js -->
    <script src="<?= base_url('assets/frontend/js/darkmode.js'); ?>"></script>

    <?php if (isset($js) && !empty($js)) : ?>
        <script src="<?= base_url('app/' . $js); ?>"></script>
    <?php endif; ?>

    <script>
        var base_url = '<?= base_url(); ?>';
        var site_url = '<?= site_url(); ?>';
    </script>

    <!-- Initiation Loading Screen  -->
    <script>
        window.addEventListener('load', function() {
            var loadingScreen = document.getElementById('loading-screen');
            var mainContent = document.getElementById('main-content');

            if (loadingScreen && mainContent) {
                // Menghilangkan loading screen dan menampilkan konten utama setelah selesai dimuat
                loadingScreen.style.display = 'none';
                mainContent.style.display = 'block';
            }
        });
    </script>

    <!-- Skrip JavaScript Flowbite -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.js"></script>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- Sweatalert -->
    <script src="<?= base_url() ?>assets/vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>

    <script>
        function logout() {
            event.preventDefault();
            Swal.fire({
                title: 'Anda yakin ingin logout?',
                text: "Anda akan logout dari sistem dan anda bisa login kembali!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, Logout!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'post',
                        url: site_url + 'auth/logout',
                        dataType: "json",
                        error: function(xhr, ajaxOptions, thrownerror) {
                            alert(xhr.status + "\n" + xhr.responseText + "\n" +
                                thrownerror);
                        },
                        success: function(response) {
                            if (response.status == 200) {
                                Swal.fire({
                                    title: "Berhasil!",
                                    text: response.message,
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 1800
                                });
                                setTimeout(function() {
                                    window.location.href = site_url
                                }, 1500);
                            } else {
                                Swal.fire({
                                    title: "Gagal!",
                                    text: 'Terjadi kesalahan server1',
                                    icon: "error",
                                    showConfirmButton: false,
                                    timer: 2100
                                });
                            }
                        },
                        error: function(xhr, ajaxOptions, thrownerror) {
                            Swal.fire({
                                title: "Maaf Kelasalahan Server!",
                                html: `Silahkan Cek kembali Kode Error: <strong>${(xhr.status + "\n")}</strong> `,
                                icon: "error",
                                showConfirmButton: false,
                                timer: 2100
                            });
                        }
                    });
                }

            });
        }
    </script>

    <script>
        $(document).ready(function() {
            $('nav ul li').click(function() {
                // Menghapus kelas aktif dari semua elemen navbar
                $('nav ul li').removeClass('active');

                // Menambahkan kelas aktif pada elemen yang diklik
                $(this).addClass('active');
            });
        });
    </script>

</body>

</html>