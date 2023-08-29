<?= $this->extend('layout/admin/master') ?>
<?= $this->section('content') ?>

<div class="row">
    <div class="col-md-12">
        <div class="card" id="tambah_galery">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5><?= (isset($title)) ? $title : ''; ?></h5>
            </div>
            <div class="card-body">
                <!-- <section> -->
                <!-- <div id="dropzone"> -->
                <form action="<?= site_url('admin/galery/store'); ?>" class="dropzone" id="my-dropzone">
                    <div class="dz-message">
                        Drop file here or click to upload
                    </div>
                </form>
                <!-- </div> -->
                <!-- </section> -->
                <section>
                    <div class="col-md-12">
                        <div class="row">
                            <?php if (count($brand) > 0) : ?>
                                <?php foreach ($brand as $g) : ?>
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
                </section>
            </div>
        </div>
    </div>
</div>

<script>
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
</script>

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

<?= $this->endSection() ?>