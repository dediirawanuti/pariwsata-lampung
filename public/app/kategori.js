$(document).ready(function () {
  loadData();
});

loadData = () => {
  $("#datatables").DataTable({
    processing: true,
    serverSide: true,
    bDestroy: true,
    responsive: true,
    ajax: {
      url: site_url + "admin/kategori/datatables",
      type: "POST",
    },
    order: [],
    columns: [
      {
        data: "no",
        orderable: false,
      },
      {
        data: "nama",
      },
      {
        data: "keterangan",
        render: function (data) {
          return data.substr(0, 30) + " ...";
        },
      },
      {
        data: "option",
        orderable: false,
      },
    ],
  });
};

add = () => {
  $.ajax({
    url: site_url + "admin/kategori/add",
    method: "POST",
    data: "JSON",
    success: function (response) {
      $(".view_modal").html(response.message);
      let myModal = new bootstrap.Modal(document.getElementById("modal_add"), {
        keyboard: false,
      });
      myModal.show();
    },
  });
};

store = () => {
  const form = $("#form_add")[0];
  const data = new FormData(form);
  const namaInput = $("#nama");
  const errorNama = $("#error_nama");

  // Reset validasi sebelum mengirim permintaan Ajax
  namaInput.removeClass("is-invalid");
  errorNama.html("");

  // Validasi jika nama hanya berisi angka
  const namaValue = namaInput.val().trim();
  if (/^\d+$/.test(namaValue)) {
    namaInput.addClass("is-invalid");
    errorNama.html("Nama tidak boleh berisi angka");
    return; // Menghentikan permintaan Ajax jika validasi gagal
  }

  // Validasi duplikasi nama
  $.ajax({
    url: site_url + "admin/kategori/check_duplicate",
    method: "POST",
    data: { nama: namaValue },
    dataType: "JSON",
    beforeSend: function () {
      // Menampilkan indikator loading saat melakukan pemeriksaan duplikasi
      // Jika diperlukan, Anda dapat menambahkan indikator loading di sini
    },
    success: function (response) {
      if (response.duplicate) {
        namaInput.addClass("is-invalid");
        errorNama.html("Nama sudah ada, silakan masukkan nama lain");
      } else {
        // Tidak ada duplikasi, lanjutkan permintaan Ajax untuk menyimpan data
        $.ajax({
          url: site_url + "admin/kategori/store",
          method: "POST",
          data: data,
          dataType: "JSON",
          processData: false,
          contentType: false,
          cache: false,
          beforeSend: function () {
            // Menampilkan indikator loading saat mengirim data form
            $(".btn-simpan").html(
              '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
            );
            $(".btn-cencel").hide(100);
            $(".btn-simpan").attr("disabled", true);
          },
          success: function (response) {
            if (response.error) {
              if (response.error.nama) {
                namaInput.addClass("is-invalid");
                errorNama.html(response.error.nama);
              } else {
                namaInput.removeClass("is-invalid");
                errorNama.html("");
              }
            } else {
              $("#modal_add").modal("hide");
              Swal.fire({
                title: "Berhasil!",
                text: response.message,
                icon: "success",
                showConfirmButton: false,
                timer: 2100,
              });
              loadData();
            }
          },
          complete: function () {
            // Mengembalikan tampilan tombol setelah permintaan Ajax selesai
            $(".btn-simpan").removeAttr("disabled");
            $(".btn-cencel").show(100);
            $(".btn-simpan").html("Tambah Kategori");
          },
          error: function (xhr, ajaxOptions, thrownerror) {
            alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
          },
        });
      }
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
    },
  });
};

edit = (id) => {
  $.ajax({
    url: site_url + "admin/kategori/edit",
    type: "POST",
    data: {
      id: id,
    },
    dataType: "JSON",
    success: function (response) {
      $(".view_modal").html(response.message);
      let myModal = new bootstrap.Modal(document.getElementById("modal_edit"), {
        keyboard: false,
      });
      myModal.show();
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      Swal.fire({
        title: "Maaf gagal load data!",
        html: `Silahkan Cek kembali Kode Error: <strong>${
          xhr.status + "\n"
        }</strong> `,
        icon: "error",
        showConfirmButton: false,
        timer: 3100,
      });
    },
  });
};

update = () => {
  const form = $("#form_edit")[0];
  const data = new FormData(form);

  const namaValue = $("#nama_edit").val();
  if (namaValue.match(/[^a-zA-Z\s]/)) {
    // Terdapat karakter khusus yang tidak diperbolehkan
    $("#nama_edit").addClass("is-invalid");
    $("#error_nama_edit").html("Nama hanya boleh huruf dan spasi");
    return; // Menghentikan eksekusi Ajax request
  }

  $.ajax({
    url: site_url + "admin/kategori/update",
    method: "POST",
    data: data,
    dataType: "JSON",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () {
      $(".btn-simpan").html(
        '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
      );
      $(".btn-cancel").hide(100);
      $(".btn-simpan").attr("disabled", true);
    },
    success: function (response) {
      if (response.error) {
        if (response.error.nama_edit) {
          $("#nama_edit").addClass("is-invalid");
          $("#error_nama_edit").html(response.error.nama_edit);
        } else {
          $("#nama_edit").removeClass("is-invalid");
          $("#error_nama_edit").html("");
        }
      } else {
        $("#modal_edit").modal("hide");
        Swal.fire({
          title: "Berhasil!",
          text: response.message,
          icon: "success",
          showConfirmButton: false,
          timer: 2100,
        });
        loadData();
      }
    },
    complete: function () {
      $(".btn-simpan").removeAttr("disabled");
      $(".btn-cancel").show(100);
      $(".btn-simpan").html("Simpan Perubahan");
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
    },
  });
};

hapus = (id) => {
  Swal.fire({
    title: "Apakah anda yakin?",
    text: "Proses ini akan menghapus data secara permanent!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, hapus!",
  }).then((result) => {
    if (result.isConfirmed) {
      let csrf = $('meta[name="csrf-token"]').attr("content");
      $.ajax({
        url: site_url + "admin/kategori/delete",
        data: {
          id: id,
          _method: "DELETE",
          _token: csrf,
        },
        type: "POST",
        dataType: "JSON",
        success: function (response) {
          Swal.fire({
            title: "Berhasil!",
            text: response.message,
            icon: "success",
            showConfirmButton: false,
            timer: 2100,
          });
          loadData();
        },
        error: function (jqXHR, textStatus, errorThrown) {
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
};
