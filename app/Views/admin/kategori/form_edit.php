<div class="modal fade" id="modal_edit" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalFullTitle">Edit Kategori</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="form_edit">
                    <?= csrf_field(); ?>
                    <input type="hidden" name="id_edit" id="id_edit" value="<?= encrypt_url($kategori['id']); ?>">
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="nama_edit">Nama</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="nama_edit" id="nama_edit" placeholder="Nama Kategori" value="<?= $kategori['nama'] ?>" data-validation="required custom" data-validation-regexp="^[a-zA-Z0-9\s_-]+$" data-validation-error-msg="Nama harus hanya mengandung huruf dan spasi" />
                            <div class="invalid-feedback" id="error_nama_edit"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="keterangan_edit">Keterangan</label>
                        <div class="col-sm-10">
                            <textarea class="form-control form-control-sm" name="keterangan_edit" id="keterangan_edit" cols="30" rows="10" placeholder="Keterangan Kategori"><?= $kategori['keterangan'] ?></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary btn-sm btn-simpan" onclick="update()">Edit Kategori</button>
            </div>
        </div>
    </div>
</div>