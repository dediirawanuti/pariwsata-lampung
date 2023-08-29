<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="<?= base_url(); ?>/assets/admin/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title><?= (isset($title) && $title != '') ? $title . ' || ' . sistem()->nama : sistem()->nama; ?></title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<?= base_url('writable/images/sistem/' . sistem()->favicon); ?>" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="<?= base_url() ?>/assets/vendor/sweetalert2/dist/sweetalert2.min.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/admin/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="<?= base_url(); ?>/assets/admin/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<?= base_url(); ?>/assets/admin/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="<?= base_url(); ?>" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <img src="<?= base_url() ?>/writable/images/sistem/<?= sistem()->logo; ?>" alt="" width="50px" height="50px">
                  </span>
                  <span class="app-brand-text demo text-body fw-bolder"><?= strtoupper(sistem()->nama); ?></span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">Adventure starts here 🚀</h4>
              <!-- <p class="mb-4">Make your app management easy and fun!</p> -->

              <form id="form-register" class="mb-3" action="#" method="POST">
                <div class="mb-3">
                  <label for="nama_lengkap" class="form-label">Full Name</label>
                  <input type="text" class="form-control form-control-sm" id="nama_lengkap" name="nama_lengkap" placeholder="Enter your fullname" autofocus/>
                  <div class="invalid-feedback d-inline" id="error_nama_lengkap"></div>
                </div>
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="Enter your username" autofocus/>
                  <div class="invalid-feedback d-inline" id="error_username"></div>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="text" class="form-control form-control-sm" id="email" name="email" placeholder="Enter your email" />
                  <div class="invalid-feedback d-inline" id="error_email"></div>
                </div>
                <div class="mb-3 form-password-toggle">
                  <label class="form-label" for="password">Password</label>
                  <div class="input-group input-group-merge">
                    <input type="password" id="password" class="form-control form-control-sm" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password"/>
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                    <div class="invalid-feedback d-inline" id="error_password"></div>
                  </div>
                </div>
                <div class="mb-3 form-password-toggle">
                  <label class="form-label" for="ulangi_password">Repeet Your Password</label>
                  <div class="input-group input-group-merge">
                    <input type="password" id="ulangi_password" class="form-control form-control-sm" name="ulangi_password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="ulangi_password"/>
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                    <div class="invalid-feedback d-inline" id="error_ulangi_password"></div>
                  </div>
                </div>

                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="terms" name="terms" />
                    <label class="form-check-label" for="terms">
                      I agree to
                      <a href="javascript:void(0);">privacy policy & terms</a>
                    </label><br>
                    <div class="invalid-feedback d-inline" id="error_terms"></div>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm w-100 btn-register">Sign up</button>
              </form>

              <p class="text-center">
                <span>Already have an account?</span>
                <a href="<?= site_url('auth/login'); ?>">
                  <span>Sign in instead</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
        </div>
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="<?= base_url(); ?>/assets/admin/vendor/libs/jquery/jquery.js"></script>
    <script src="<?= base_url(); ?>/assets/admin/vendor/libs/popper/popper.js"></script>
    <script src="<?= base_url(); ?>/assets/admin/vendor/js/bootstrap.js"></script>
    <script src="<?= base_url(); ?>/assets/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="<?= base_url(); ?>/assets/admin/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="<?= base_url(); ?>/assets/admin/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <script src="<?= base_url() ?>/assets/vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>

    <script>
      var base_url = '<?= base_url(); ?>';
      var site_url = '<?= site_url(); ?>';
    </script>

    <?php if (isset($js) && !empty($js)) : ?>
      <script src="<?= base_url('app/' . $js); ?>"></script>
    <?php endif; ?>
  </body>
</html>