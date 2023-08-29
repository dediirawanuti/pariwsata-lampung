<div class="modal fade" id="modal_add" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalFullTitle">Tambah Users</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- <form action="" method="post" id="form_add">
                    <?= csrf_field(); ?>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <div class="card mb-3">
                                <div class="d-flex justify-content-center gap-4 mt-2">
                                    <img src="<?= base_url('writable/images/profile/no-image.jpg'); ?>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="foto_show" />
                                    <div class="button-wrapper">
                                        <label for="foto" class="btn btn-primary me-2 my-4" tabindex="0">
                                            <span class="d-none d-sm-block">Tambah Foto</span>
                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                            <input type="file" name="foto" id="foto" class="account-file-input" hidden accept="image/png, image/jpeg, image/jpg" />
                                        </label>

                                        <p class="text-muted mb-0">Allowed JPG, JPEG or PNG. Max size of 2Mb</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="nama">Nama Lengkap</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="nama" id="nama" placeholder="Nama Lengkap" />
                            <div class="invalid-feedback" id="error_nama"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="username">Username</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="username" id="username" placeholder="Username" />
                            <div class="invalid-feedback" id="error_username"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="email">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control form-control-sm" name="email" id="email" placeholder="Email" />
                            <div class="invalid-feedback" id="error_email"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="password">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control form-control-sm" name="password" id="password" placeholder="Password" />
                            <div class="invalid-feedback" id="error_password"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="ulangi_password">Ulangi Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control form-control-sm" name="ulangi_password" id="ulangi_password" placeholder="Ulangi Password" />
                            <div class="invalid-feedback" id="error_ulangi_password"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="hak_akses">Hak Akses</label>
                        <div class="col-sm-10">
                            <select class="form-select form-select-sm" id="hak_akses" name="hak_akses" aria-label="Hak Akses">
                                <option value="" selected>Piih Hak Akses</option>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                            <div class="invalid-feedback" id="error_hak_akses"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="status">Status</label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input name="status" class="form-check-input status" type="radio" value="aktif" id="status_aktif" />
                                <label class="form-check-label" for="status_aktif"> Aktif </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input name="status" class="form-check-input status" type="radio" value="tidak_aktif" id="status_tidak_aktif" />
                                <label class="form-check-label" for="status_tidak_aktif"> Tidak Aktif </label>
                                <div class="invalid-feedback d-inline error_status"></div>
                            </div>
                        </div>
                    </div>
                </form> -->
                <form action="" method="post" id="form_add">
                    <?= csrf_field(); ?>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <div class="card mb-3">
                                <div class="d-flex justify-content-center gap-4 mt-2">
                                    <img src="<?= base_url('writable/images/profile/no-image.png'); ?>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="foto_show" />
                                    <div class="button-wrapper">
                                        <label for="foto" class="btn btn-primary me-2 my-4" tabindex="0">
                                            <span class="d-none d-sm-block">Tambah Foto</span>
                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                            <input type="file" name="foto" id="foto" class="account-file-input" hidden accept="image/png, image/jpeg, image/jpg" />
                                            <div class="invalid-feedback" id="error_foto"></div>
                                        </label>
                                        <p class="text-muted mb-0">Allowed JPG, JPEG, or PNG.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="nama">Nama Lengkap</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="nama" id="nama" placeholder="Nama Lengkap" data-validation="required custom" data-validation-regexp="^[a-zA-Z\s]+$" data-validation-error-msg="Nama harus diisi dan tidak boleh mengandung angka" />
                            <div class="invalid-feedback" id="error_nama"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="username">Username</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="username" id="username" placeholder="Username" data-validation="required custom" data-validation-regexp="^[a-zA-Z0-9_.]+$" />
                            <div class="invalid-feedback" id="error_username"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="email">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control form-control-sm" name="email" id="email" placeholder="Email" />
                            <div class="invalid-feedback" id="error_email"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="password">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control form-control-sm" name="password" id="password" placeholder="Password" data-validation="required custom" data-validation-regexp="^(?=.*[A-Z]).+$" />
                            <div class="invalid-feedback" id="error_password"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="ulangi_password">Ulangi Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control form-control-sm" name="ulangi_password" id="ulangi_password" placeholder="Ulangi Password" />
                            <div class="invalid-feedback" id="error_ulangi_password"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="hak_akses">Hak Akses</label>
                        <div class="col-sm-10">
                            <select class="form-select form-select-sm" id="hak_akses" name="hak_akses" aria-label="Hak Akses">
                                <option value="" selected>Pilih Hak Akses</option>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                            <div class="invalid-feedback" id="error_hak_akses"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="status">Status</label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input name="status" class="form-check-input status" type="radio" value="aktif" id="status_aktif" />
                                <label class="form-check-label" for="status_aktif"> Aktif </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input name="status" class="form-check-input status" type="radio" value="tidak_aktif" id="status_tidak_aktif" />
                                <label class="form-check-label" for="status_tidak_aktif"> Tidak Aktif </label>
                                <div class="invalid-feedback d-inline error_status"></div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary btn-sm btn-simpan" onclick="store()">Tambah User</button>
            </div>
        </div>
    </div>
</div>