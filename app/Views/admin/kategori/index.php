<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5><?= (isset($title)) ? $title : ''; ?></h5>
                <button type="button" class="btn btn-primary btn-sm btn-tambah" onclick="add()">Tambah Kategori</button>
            </div>
            <div class="card-body">
                <table class="table table-hover table-responsive" id="datatables">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama</th>
                            <th>keterangan</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>