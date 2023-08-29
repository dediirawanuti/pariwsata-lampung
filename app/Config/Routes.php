<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.


$routes->post('dashboard/encrypt_url', 'DashboardController::encrypt_url');
$routes->post('dashboard/decrypt_url', 'DashboardController::decrypt_url');

// Route User Frontend
$routes->group('', function ($routes) {
    $routes->get('/', 'HomeController::index');
    $routes->get('kategori', 'HomeController::kategori_show');
    $routes->get('kategori/(:hash)', 'HomeController::kategori/$1');
    $routes->get('maps/(:hash)', 'HomeController::show/$1');
    $routes->get('tentang', 'HomeController::tentang');
    $routes->get('profile', 'HomeController::profile');
    $routes->get('collabs', 'HomeController::collabs');
    // $routes->get('search', 'HomeController::search');

    // // Add Komentar
    $routes->post('komentar', 'KomentarController::store');
    // // Change Rating
    $routes->post('rating', 'HomeController::rating');
    // Update user
    $routes->post('change_profile', 'UsersController::change_profile');
    // Update Profile
    $routes->post('change_foto', 'UsersController::change_foto');
    // Change password for user
    $routes->post('change_password', 'UsersController::change_password', ['filter' => 'auth']);
});

$routes->group('auth', function ($routes) {
    $routes->get('/', 'AuthController::index');
    $routes->get('login', 'AuthController::index');
    $routes->post('login', 'AuthController::login');
    $routes->get('register', 'AuthController::form_register');
    $routes->post('register', 'AuthController::register');

    $routes->get('forgot', 'AuthController::form_forgot');
    $routes->post('forgot', 'AuthController::forgot');
    $routes->get('reset/(:hash)', 'AuthController::form_reset/$1');
    $routes->post('reset', 'AuthController::reset_password');
    $routes->post('logout', 'AuthController::logout');
});

$routes->group('admin', ['filter' => ['auth', 'isAdmin']], function ($routes) {
    $routes->get('/', 'DashboardController::index');

    $routes->group('maps', function ($routes) {
        $routes->get('/', 'MapsController::index');
        $routes->get('detail-maps/(:any)', 'MapsController::detail/$1');
        $routes->get('manajemen-maps', 'MapsController::manajemenMaps');
        $routes->post('datatables', 'MapsController::datatables');
        $routes->get('add', 'MapsController::add');
        $routes->post('store', 'MapsController::store');
        $routes->get('edit/(:any)', 'MapsController::edit/$1');
        $routes->post('update', 'MapsController::update');
        $routes->delete('delete', 'MapsController::delete');
    });

    $routes->group('kategori', function ($routes) {
        $routes->get('/', 'KategoriController::index');
        $routes->post('datatables', 'KategoriController::datatables');
        $routes->post('add', 'KategoriController::add');
        $routes->post('check_duplicate', 'KategoriController::check_duplicate');
        $routes->post('edit', 'KategoriController::edit');
        $routes->post('update', 'KategoriController::update');
        $routes->post('store', 'KategoriController::store');
        $routes->delete('delete', 'KategoriController::delete');
    });

    $routes->group('sistem', function ($routes) {
        $routes->get('/', 'SistemController::index');
        $routes->post('update', 'SistemController::update');
        $routes->post('save_logo_favicon', 'SistemController::save_logo_favicon');
        $routes->get('brand', 'SistemController::brand');
    });

    $routes->group('users', function ($routes) {
        $routes->get('/', 'UsersController::index');
        $routes->post('datatables', 'UsersController::datatables');
        $routes->post('add', 'UsersController::add');
        $routes->post('store', 'UsersController::store');
        $routes->post('edit', 'UsersController::edit');
        $routes->post('update', 'UsersController::update');
        $routes->post('detail', 'UsersController::detail');
        $routes->delete('delete', 'UsersController::delete');
        $routes->post('change_password', 'UsersController::change_password');
    });

    $routes->group('komentar', function ($routes) {
        $routes->get('/', 'KomentarController::index');
        $routes->post('datatables', 'KomentarController::datatables');
        $routes->post('store', 'KomentarController::store');
        $routes->post('detail', 'KomentarController::detail');
        $routes->post('approve', 'KomentarController::approve');
        $routes->post('reject', 'KomentarController::reject');
        $routes->delete('delete', 'KomentarController::delete');
    });
});

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
