<div class="modal fade" id="modal_detail" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalFullTitle">Detail Komentar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-2">
                    <label class="col-sm-2 col-form-label" for="nama">Nama Lengkap</label>
                    <div class="col-sm-10">
                        <h6 class="card-title text-primary"><?= $komentar['nama']; ?></h6>
                    </div>
                </div>
                <div class="row mb-2">
                    <label class="col-sm-2 col-form-label" for="wisata">Wisata</label>
                    <div class="col-sm-10">
                        <h6 class="card-title text-primary"><?= $komentar['title']; ?></h6>
                    </div>
                </div>
                <div class="row mb-2">
                    <label class="col-sm-2 col-form-label" for="komentar">Komentar</label>
                    <div class="col-sm-10">
                        <h6 class="card-title text-primary"><?= $komentar['body']; ?></h6>
                    </div>
                </div>

                <div class="row mb-2">
                    <label class="col-sm-2 col-form-label" for="status">Status</label>
                    <div class="col-sm-10">
                        <?php
                        if ($komentar['status'] == 'pending') {
                            $label_color = 'warning';
                            $label = 'Pending';
                        } else if ($komentar['status'] == 'approve') {
                            $label_color = 'success';
                            $label = 'Approved';
                        } else {
                            $label_color = 'danger';
                            $label = 'Rejected';
                        }
                        echo '<span class="badge rounded-pill bg-' . $label_color . '">' . $label . '</span>';
                        ?>
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-sm btn-success" data-bs-dismiss="modal" onclick="approve('<?= encrypt_url($komentar['id']); ?>')">
                            <span class="tf-icons bx bx-check"></span> Approve
                        </button>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-sm btn-warning" data-bs-dismiss="modal" onclick="reject('<?= encrypt_url($komentar['id']); ?>')">
                            <span class="tf-icons bx bx-x"></span> Reject
                        </button>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal" onclick="hapus('<?= encrypt_url($komentar['id']); ?>')">
                            <span class="tf-icons bx bx-trash"></span> Delete
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>