<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5><?= (isset($title)) ? $title : ''; ?></h5>
                <button type="submit" class="btn btn-primary btn-sm btn-simpan" onclick="store()">Tambah Maps</button>
            </div>
            <div class="card-body">
                <form action="" method="post" id="form_add">
                    <?= csrf_field(); ?>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <div class="card mb-3">
                                <div class="d-flex justify-content-center gap-4 mt-2">
                                    <img src="<?= base_url('writable/images/maps/no-image.jpg'); ?>" alt="user-avatar" class="d-block rounded" height="100" width="100" id="foto_show" />
                                    <div class="button-wrapper">
                                        <label for="foto" class="btn btn-primary me-2 my-4" tabindex="0">
                                            <span class="d-none d-sm-block">Tambah Cover</span>
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
                            <input type="text" class="form-control" name="title" id="title" placeholder="Title Maps" />
                            <div class="invalid-feedback" id="error_title"></div>
                        </div>
                    </div>

                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="kategori">Kategori</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="kategori" id="kategori" required>
                                <?php foreach ($kategori as $key) : ?>
                                    <option value="<?= $key['id'] ?>"><?= $key['nama'] ?></option>
                                <?php endforeach ?>
                            </select>
                        </div>
                    </div>

                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="gmaps">GMaps</label>
                        <div class="col-sm-10">
                            <textarea name="gmaps" id="gmaps" rows="4" cols="50" required></textarea>
                            <div class="invalid-feedback" id="error_gmaps"></div>
                        </div>
                    </div>

                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="desc">Desc</label>
                        <div class="col-sm-10">
                            <textarea name="desc" id="desc"></textarea>
                        </div>
                    </div>

                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label" for="alamat">Tempat</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="alamat" id="alamat" placeholder="Tempat Objek Wisata" required />
                            <div class="invalid-feedback" id="error_alamat"></div>
                        </div>
                    </div>

                    <div class="row my-4">
                        <label class="col-sm-2 col-form-label">Status</label>
                        <div class="col-sm-10 d-flex">
                            <div class="form-check">
                                <input name="status" class="form-check-input" type="radio" value="publish" id="defaultRadio1" checked required />
                                <label class="form-check-label" for="defaultRadio1"> Publish </label>
                            </div>
                            <div class="form-check" style="margin-left: 0.9%;">
                                <input name="status" class="form-check-input" type="radio" value="draft" id="defaultRadio2" required />
                                <label class="form-check-label" for="defaultRadio2"> Draft </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

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