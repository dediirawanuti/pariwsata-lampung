<?= $this->extend('frontend/master'); ?>
<?= $this->section('content'); ?>


<div class="flex flex-col mx-4 md:mx-24 my-4 md:my-20">
    <h3 class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Profil User</h3>
    <div class="flex flex-row gap-6">
        <div class="w-2/5 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mt-4">
            <div class="flex flex-col items-center pt-4 pb-4">
                <img class="w-24 h-24 mb-3 rounded-full shadow-lg" src="<?= base_url('writable/images/profile/' . $profile['foto']); ?>" alt="user image" id="current_foto" width="118" height="118" />
                <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white"><?= $profile['nama']; ?></h5>
                <div class="flex mt-4 space-x-3 md:mt-6">
                    <form action="" method="post" id="form-foto">
                        <label for="foto" tabindex="0" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Update Foto
                            <input type="hidden" name="id" value="<?= encrypt_url($profile['id']); ?>">
                            <input id="foto" name="foto" type="file" hidden accept="image/png, image/jpeg, image/jpg" />
                        </label>
                    </form>
                </div>
                <div class="p-4 my-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                    <span class="font-medium" id="error_foto"></span>
                </div>
                <span class="mt-4 text-sm text-gray-500 dark:text-gray-400">Allowed JPG, JPEG or PNG.</span>
            </div>
        </div>
        <div class="w-3/5 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mt-4">
            <form class="px-8 pt-6 pb-8 mb-4" action="" method="post" id="form_edit">
                <?= csrf_field(); ?>
                <input type="hidden" name="id" value="<?= encrypt_url($profile['id']); ?>">
                <div class="grid gap-6 mb-2 md:grid-cols-2">
                    <label class="block text-gray-700 text-md mb-2 font-semibold dark:text-gray-400" for="nama">
                        Nama Lengkap
                    </label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="nama" id="nama" type="text" placeholder="Nama Lengkap" value="<?= $profile['nama']; ?>">
                </div>
                <div class="flex flex-row-reverse my-2">
                    <div class="p-2 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                        <span class="font-medium" id="error_nama"></span>
                    </div>
                </div>
                <div class="text-sm text-red-600 dark:text-red-500" id="error_nama"></div>
                <div class="grid gap-6 mb-2 md:grid-cols-2">
                    <label class="block text-gray-700 text-md mb-2 font-semibold dark:text-gray-400" for="username">
                        Username
                    </label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="username" id="username" type="text" placeholder="Username" value="<?= $profile['username']; ?>">
                </div>
                <div class="flex flex-row-reverse my-2">
                    <div class="p-2 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                        <span class="font-medium" id="error_username"></span>
                    </div>
                </div>
                <div class="grid gap-6 mb-2 md:grid-cols-2">
                    <label class="block text-gray-700 text-md mb-2 font-semibold dark:text-gray-400" for="email">
                        Email
                    </label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="email" id="email" type="email" placeholder="Email" value="<?= $profile['email']; ?>">
                </div>
                <div class="flex flex-row-reverse my-2">
                    <div class="p-2 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
                        <span class="font-medium" id="error_email"></span>
                    </div>
                </div>
                <div class="flex flex-row gap-6">
                    <button type="submit" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 btn-simpan" onclick="change_profile()">Update Profile</button>
                    <button type="button" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" data-modal-target="popup-modal" data-modal-toggle="popup-modal">Update Password</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Pop Up Modal -->
<div id="popup-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-md max-h-full" role="document">
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-hide="popup-modal">
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                </svg>
                <span class="sr-only">Close modal</span>
            </button>
            <div class="p-6">
                <h3 class="text-center mb-5 text-lg font-normal text-gray-500 dark:text-gray-200">Hi <?= $profile['nama']; ?>, Apakah anda ingin mengubah password?</h3>
                <div class="bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mt-4 p-4">
                    <form action="" method="post" id="form_change_password">
                        <?= csrf_field(); ?>
                        <input type="hidden" name="id" value="<?= encrypt_url($profile['id']); ?>">
                        <div class="grid gap-6 mb-4 md:grid-cols-2">
                            <label class="block text-gray-700 text-md font-semibold dark:text-gray-400" for="password_lama">
                                Password Lama
                            </label>
                            <div>
                                <input type="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="password_lama" id="password_lama" placeholder="***********">
                                <div class="mt-2 text-sm text-red-600 dark:text-red-500" id="error_password_lama"></div>
                            </div>
                        </div>
                        <div class="grid gap-6 mb-4 md:grid-cols-2">
                            <label class="block text-gray-700 text-md font-semibold dark:text-gray-400" for="password">
                                Password
                            </label>
                            <div class="">
                                <input type="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="password" id="password" placeholder="***********">
                                <div class="mt-2 text-sm text-red-600 dark:text-red-500" id="error_password"></div>
                            </div>
                        </div>
                        <div class="grid gap-6 mb-4 md:grid-cols-2">
                            <label class="block text-gray-700 text-md font-semibold dark:text-gray-400" for="ulangi_password">
                                Password
                            </label>
                            <div class="">
                                <input type="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="ulangi_password" id="ulangi_password" placeholder="***********">
                                <div class="mt-2 text-sm text-red-600 dark:text-red-500" id="error_ulangi_password"></div>
                            </div>
                        </div>
                        <button type="submit" onclick="change_password()" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2 btn-simpan btn_change_password">
                            Update Password
                        </button>
                        <button data-modal-hide="popup-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">No, cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Sweetalert 2 -->
<script src="<?= base_url() ?>/assets/vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>

<script>
    function change_profile() {
        event.preventDefault();
        const form = $("#form_edit")[0];
        const data = new FormData(form);
        $.ajax({
            type: "post",
            url: site_url + "change_profile",
            data: data,
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            cache: false,
            dataType: "json",
            beforeSend: function() {
                $(".btn-simpan").html(
                    '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div>'
                );
                $(".btn-simpan").attr("disabled", true);
            },
            complete: function() {
                $(".btn-simpan").removeAttr("disabled");
                $(".btn-simpan").html("Update Profile");
            },
            error: function(xhr, ajaxOptions, thrownerror) {
                alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
            },
            success: function(response) {
                if (response.error) {
                    if (response.error.nama) {
                        $("#nama").addClass("is-invalid");
                        $("#error_nama").html(response.error.nama);
                    } else {
                        $("#nama").removeClass("is-invalid");
                        $("#error_nama").html("");
                    }
                    if (response.error.username) {
                        $("#username").addClass("is-invalid");
                        $("#error_username").html(response.error.username);
                    } else {
                        $("#username").removeClass("is-invalid");
                        $("#error_username").html("");
                    }
                    if (response.error.email) {
                        $("#email").addClass("is-invalid");
                        $("#error_email").html(response.error.email);
                    } else {
                        $("#email").removeClass("is-invalid");
                        $("#error_email").html("");
                    }

                } else {
                    Swal.fire({
                        title: "Berhasil!",
                        text: response.message,
                        icon: "success",
                        showConfirmButton: false,
                        timer: 2100,
                    });
                    setTimeout(() => {
                        window.location.reload();
                    }, 1800);
                }
            },
            error: function(xhr, ajaxOptions, thrownerror) {
                Swal.fire({
                    title: "Maaf data gagal di muat!",
                    html: `Silahkan Cek kembali Kode Error: <strong>${
          xhr.status + "\n"
        }</strong> `,
                    icon: "error",
                    showConfirmButton: false,
                    timer: 2100,
                });
            },
        });
    }

    function change_password() {
        const data = $("#form_change_password").serialize();
        $.ajax({
            type: "post",
            url: site_url + "change_password",
            data: data,
            dataType: "json",
            beforeSend: function() {
                $(".btn_change_password").html(
                    '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
                );
                $(".btn_close").hide(100);
                $(".btn_change_password").attr("disabled", true);
            },
            complete: function() {
                $(".btn_change_password").removeAttr("disabled");
                $(".btn_close").show(100);
                $(".btn_change_password").html("Ubah Password");
            },
            error: function(xhr, ajaxOptions, thrownerror) {
                alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
            },
            success: function(response) {
                if (response.error) {
                    if (response.error.password_lama) {
                        $("#password_lama").addClass("is-invalid");
                        $("#error_password_lama").html(response.error.password_lama);
                    } else {
                        $("#password_lama").removeClass("is-invalid");
                        $("#error_password_lama").html("");
                    }
                    if (response.error.password) {
                        $("#password").addClass("is-invalid");
                        $("#error_password").html(response.error.password);
                    } else {
                        $("#password").removeClass("is-invalid");
                        $("#error_password").html("");
                    }
                    if (response.error.ulangi_password) {
                        $("#ulangi_password").addClass("is-invalid");
                        $("#error_ulangi_password").html(response.error.ulangi_password);
                    } else {
                        $("#ulangi_password").removeClass("is-invalid");
                        $("#error_ulangi_password").html("");
                    }
                } else {
                    $("#popup-modal").modal("hide");
                    Swal.fire({
                        title: "Berhasil!",
                        text: response.message,
                        icon: "success",
                        showConfirmButton: false,
                        timer: 2100,
                    });
                    $(input).val('');
                }
            },
            error: function(xhr, ajaxOptions, thrownerror) {
                Swal.fire({
                    title: "Maaf data gagal di ubah!",
                    html: `Silahkan Cek kembali Kode Error: <strong>${
          xhr.status + "\n"
        }</strong> `,
                    icon: "error",
                    showConfirmButton: false,
                    timer: 2100,
                });
            },
        });
    }

    $('#form-foto').on('change', function() {
        change_foto('#form-foto');
    });

    function change_foto(selector) {
        const form = $(selector)[0];
        const data = new FormData(form);

        $.ajax({
            type: "post",
            url: site_url + "change_foto",
            data: data,
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            cache: false,
            async: false,
            dataType: "json",
            success: function(response) {
                if (response.error) {
                    if (response.error.foto) {
                        $("#foto").addClass("is-invalid");
                        $("#current_foto").attr("src", $("#current_foto").data("default"));
                        $("#error_foto").html(response.error.foto);
                    } else {
                        $("#foto").removeClass("is-invalid");
                        $("#error_foto").html("");
                    }
                } else {
                    Swal.fire({
                        title: "Berhasil!",
                        text: response.message,
                        icon: "success",
                        showConfirmButton: false,
                        timer: 1500,
                    });
                }
            }

        });
    }

    function readURLFoto(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $("#foto_show").attr("src", e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#foto").change(function() {
        readURLFoto(this);
    });
</script>

<?= $this->endSection(); ?>