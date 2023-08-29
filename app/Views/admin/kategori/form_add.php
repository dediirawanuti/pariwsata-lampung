<div class="modal fade" id="modal_add" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalFullTitle">Tambah Kategori</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="form_add">
                    <?= csrf_field(); ?>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="nama">Nama</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control form-control-sm" name="nama" id="nama" placeholder="Nama Kategori" data-validation="required custom" data-validation-regexp="^[a-zA-Z\s]+$" data-validation-error-msg="Nama harus diisi dan tidak boleh mengandung angka" />
                            <div class="invalid-feedback" id="error_nama"></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-sm-2 col-form-label" for="keterangan">Keterangan</label>
                        <div class="col-sm-10">
                            <textarea class="form-control form-control-sm" name="keterangan" id="keterangan" cols="30" rows="10" placeholder="Keterangan Kategori"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary btn-sm btn-simpan" onclick="store()">Tambah Kategori</button>
            </div>
        </div>
    </div>
</div>