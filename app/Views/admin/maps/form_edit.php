<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5><?= (isset($title)) ? $title : ''; ?></h5>
                <div>
                    <!-- <a href="#tambah_galery" class="btn btn-info btn-sm mx-3">Tambah Galery</a> -->
                    <button type="submit" class="btn btn-primary btn-sm btn-tambah" onclick="update()">Edit Maps</button>
                </div>
            </div>
            <div class="card-body">
                <form action="" method="post" id="form_edit">
                    <?= csrf_field(); ?>
                    <input type="hidden" name="id" value="<?= $map['id'] ?>">
                    <!-- <div class="d-flex justify-content-center gap-4 mb-4">
                        <img src="<?= base_url('writable/images/maps/' . $map['cover']); ?>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="foto_show" />
                        <div class="button-wrapper">
                            <label for="foto" class="btn btn-primary btn-sm me-2 my-4" tabindex="0">
                                <span class="d-none d-sm-block">Tambah Cover</span>
                                <i class="bx bx-upload d-block d-sm-none"></i>
                                <input type="file" name="cover" id="foto" class="account-file-input" hidden accept="image/png, image/jpeg, image/jpg" />
                                <div class="invalid-feedback" id="error_error"></div>
                            </label>
                            <p class="text-muted mb-0">Allowed JPG, JPEG or PNG.</p>
                        </div>
                    </div> -->
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <div class="card mb-3">
                                <div class="d-flex justify-content-center gap-4 mt-2">
                                    <img src="<?= base_url('writable/images/maps/no-image.jpg'); ?>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="foto_show" />
                                    <div class="button-wrapper">
                                        <label for="foto" class="btn btn-primary me-2 my-4" tabindex="0">
                                            <span class="d-none d-sm-block">Update Cover</span>
                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                            <input type="file" name="foto" id="foto" class="account-file-input" hidden accept="image/png, image/jpeg, image/jpg" />
                                            <div class="invalid-feedback" id="error_cover"></div>
                                        </label>
                                        <p class="text-muted mb-0">Allowed JPG, JPEG, or PNG.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="title">Title</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" id="title" placeholder="Title Maps" value="<?= $map['title'] ?>" />
                            <div class="invalid-feedback" id="error_title"></div>
                        </div>
                    </div>
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="kategori">Kategori</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="kategori" id="">
                                <?php foreach ($kategori as $key) : ?>
                                    <option value="<?= $key['id'] ?>" <?= ($map['category_id'] === $key['id'] ? 'selected' : '') ?>><?= $key['nama'] ?></option>
                                <?php endforeach ?>
                            </select>
                        </div>
                    </div>
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="gmaps">GMaps</label>
                        <div class="col-sm-10">
                            <textarea style="width:100%" name="gmaps" rows="4" cols="50"><?= $map['gmaps'] ?></textarea>
                            <div class="invalid-feedback" id="error_gmaps"></div>
                        </div>
                    </div>
                    <!-- <div class="row my-3">
                        <div class="col-2">
                            <label class="form-label" for="maps">Maps</label>
                        </div>
                        <div class="col-10 position-relative">
                            <div id="map" style="height: 500px; border-radius: 5px"></div>
                            <div style="margin-top: 1rem; z-index: 99;position: absolute; top: 0; left: 4rem;" class="d-flex">
                                <input type="hidden" class="form-control" value="<?= $map['lat'] ?>" id="lat" name="lat" placeholder="lat">
                                <input type="hidden" class="form-control" value="<?= $map['lng'] ?>" id="lng" name="lng" style=" margin-left: 1rem; margin-right: 1rem;" placeholder="lng">
                            </div>
                        </div>
                    </div> -->
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="desc">Desc</label>
                        <div class="col-sm-10">
                            <textarea name="desc" id="desc"><?= $map['desc'] ?></textarea>
                        </div>
                    </div>
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="alamat">Alamat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="alamat" id="alamat" placeholder="Alamat Maps" value="<?= $map['alamat'] ?>" />
                            <div class="invalid-feedback" id="error_alamat"></div>
                        </div>
                    </div>
                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="">Status</label>
                        <div class="col-sm-10 d-flex">
                            <div class="form-check">
                                <input name="status" class="form-check-input" type="radio" value="publish" id="defaultRadio1" <?= (isset($map['status']) && $map['status'] === 'publish' ? 'checked' : '') ?> />
                                <label class="form-check-label" for="defaultRadio1"> Publish </label>
                            </div>
                            <div class="form-check" style="margin-left: 0.9%;">
                                <input name="status" class="form-check-input" type="radio" value="draft" id="defaultRadio2" <?= (isset($map['status']) && $map['status'] === 'draft' ? 'checked' : '') ?> />
                                <label class="form-check-label" for="defaultRadio2"> Draft </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- <div class="card mt-4" id="tambah_galery">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5>Tambah Galery</h5>
            </div>
            <div class="card-body"> -->
        <!-- <section> -->
        <!-- <div id="dropzone"> -->
        <!-- <form action="<?= site_url('admin/galery/store'); ?>" class="dropzone" id="my-dropzone">
                    <input type="hidden" name="maps_id" value="<?= encrypt_url($map['id']); ?>">
                    <div class="dz-message">
                        Drop file here or click to upload
                    </div>
                </form> -->
        <!-- </div> -->
        <!-- </section> -->
        <!-- <section>
                    <div class="col-md-12">
                        <div class="row">
                            <?php if (count($galery) > 0) : ?>
                                <?php foreach ($galery as $g) : ?>
                                    <div class="col-md-3 mt-4">
                                        <div class="text-center">
                                            <img src="<?= base_url('writable/images/galery/' . $g['filename']); ?>" alt="user-avatar" class="d-block mx-auto rounded" height="100" width="100" id="foto_show" />
                                            <button type="button" class="btn btn-outline-danger btn-sm my-1" onclick="deleteImage('<?= encrypt_url($g['id']); ?>')">
                                                <span class="tf-icons bx bx-trash"></span>&nbsp; Delete
                                            </button>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </section> -->
        <!-- </div>
        </div>
    </div>
</div> -->

        <!-- <script>
    Dropzone.options.myDropzone = {
        paramName: 'file',
        maxFilessize: 2,
        acceptedFiles: ".jpeg, .jpg, .png",
        init: function() {
            this.on("complete", file => {
                window.location.reload();
            })
        }
    }
</script> -->

        <script>
            function deleteImage(id) {
                Swal.fire({
                    title: "Apakah anda yakin?",
                    text: "Proses ini akan menghapus foto secara permanent!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Ya, hapus!",
                }).then((result) => {
                    if (result.isConfirmed) {
                        let csrf = $('meta[name="csrf-token"]').attr("content");
                        $.ajax({
                            url: site_url + "admin/galery/delete",
                            data: {
                                id: id,
                                _method: "DELETE",
                                _token: csrf,
                            },
                            type: "POST",
                            dataType: "JSON",
                            success: function(response) {
                                Swal.fire({
                                    title: "Berhasil!",
                                    text: response.message,
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 2100,
                                }).then(() => {
                                    window.location.reload();
                                });
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                Swal.fire({
                                    title: "Maaf data gagal di hapus!",
                                    html: `Silahkan Cek kembali Kode Error: <strong>${
              jqXHR.status + "\n"
            }</strong> `,
                                    icon: "error",
                                    showConfirmButton: false,
                                    timer: 2100,
                                });
                            },
                        });
                    }
                });
            }
        </script>

        <script>
            $('#desc').summernote({
                placeholder: 'Deskripsi Maps',
                tabsize: 2,
                height: 300,
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture', 'video']],
                    ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });
        </script>

        <?= $this->endSection() ?>